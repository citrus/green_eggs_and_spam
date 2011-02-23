module GreenEggsAndSpam  
  
  module ActionController
    
    def self.included(base)
      base.extend GreenEggsAndSpam::ActionController::ClassMethods
    end
    
    module ClassMethods
      def has_anti_spam
        self.send(:include, GreenEggsAndSpam::ActionController::InstanceMethods)
        self.class_eval do
          helper GreenEggsAndSpam::AntiSpamFormHelper
          before_filter :setup_anti_spam, :only => [:index,:new, :create]
          private
            def setup_anti_spam         
              @antispam_key = GreenEggsAndSpam::AntiSpam.random_key
            end
        end
      end
    end
    
    module InstanceMethods
      def anti_spam_valid?
        GreenEggsAndSpam::AntiSpam.valid?(params)
      end
    end
    
  end
  
end

ActionController::Base.send(:include, GreenEggsAndSpam::ActionController) if defined?(ActionController)