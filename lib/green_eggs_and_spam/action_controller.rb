module GreenEggsAndSpam  
  
  module ActionController
    
    # Adds the `has_anti_spam` method into ActionController::Base
    def self.included(base)
      base.extend GreenEggsAndSpam::ActionController::ClassMethods
    end
    
    module ClassMethods
    
      # Installs GreenEggsAndSpam's functionality into the supplied controller
      def has_anti_spam
        self.send(:include, GreenEggsAndSpam::ActionController::InstanceMethods)
        self.class_eval do
          helper GreenEggsAndSpam::AntiSpamFormHelper
          before_filter :setup_anti_spam, :only => [:index,:new,:create]
          private
            # Sets the antispam key to a random one
            def setup_anti_spam
              @antispam_key = GreenEggsAndSpam.random_key
            end
        end
      end
    end
    
    module InstanceMethods
      
      # Validates the supplied antispam params
      def anti_spam_valid?
        GreenEggsAndSpam.validates?(params[:antispam])
      end
    end
    
  end
  
end

ActionController::Base.send(:include, GreenEggsAndSpam::ActionController) if defined?(ActionController)