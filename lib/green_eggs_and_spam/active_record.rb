require 'green_eggs_and_spam/anti_spam_validator'

module GreenEggsAndSpam  
  
  module ActiveRecord
    
    # Adds the `validates_anti_spam` method into ActiveRecord::Base
    def self.included(base)
      base.extend GreenEggsAndSpam::ActiveRecord::ClassMethods
    end
    
    module ClassMethods
    
      # Installs GreenEggsAndSpam's validation functionality into the supplied model
      def validates_anti_spam
        self.class_eval do
          attr_accessor :antispam
          validates_with GreenEggsAndSpam::AntiSpamValidator
        end
      end
      
    end
    
  end
  
end

ActiveRecord::Base.send(:include, GreenEggsAndSpam::ActiveRecord) if defined?(ActiveRecord)