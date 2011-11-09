require 'helper'

class TestActiveRecord < MiniTest::Unit::TestCase
  
  should "ensure active record includes module" do
    assert ActiveRecord::Base.included_modules.include?(GreenEggsAndSpam::ActiveRecord)
  end
  
  should "respond to validates_anti_spam" do
    assert ActiveRecord::Base.respond_to?(:validates_anti_spam)
  end
  
end
