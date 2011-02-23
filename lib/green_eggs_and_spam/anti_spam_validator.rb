module GreenEggsAndSpam
  
  class AntiSpamValidator < ActiveModel::Validator
  
    def validate(record)
      record.errors[:base] << GreenEggsAndSpam.options[:error_message] unless GreenEggsAndSpam.validates?(record.antispam)
    end
  
  end
  
end