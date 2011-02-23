require 'helper'

class TestOptions < Test::Unit::TestCase

  def setup
    GreenEggsAndSpam.options.default!
  end
  
  should "initiate new options" do
    assert GreenEggsAndSpam.options.is_a?(GreenEggsAndSpam::Options)
    assert GreenEggsAndSpam.options.is_a?(Hash)
  end
  
  should "initiate with default options" do
    assert GreenEggsAndSpam.options.keys.include?(:key_index)
    assert GreenEggsAndSpam.options.keys.include?(:form_options)
  end
  
  should "set new and get an option" do
    GreenEggsAndSpam.options[:something] = 'nothing'
    assert GreenEggsAndSpam.options.keys.include?(:something)
    assert_equal 'nothing', GreenEggsAndSpam.options[:something]
  end
  
  should "convert keys into symbols" do
    GreenEggsAndSpam.options['something'] = 'nothing'
    assert !GreenEggsAndSpam.options.keys.include?('something')
    assert GreenEggsAndSpam.options.keys.include?(:something)
    assert_equal 'nothing', GreenEggsAndSpam.options[:something]
  end
  
  should "convert requested key into symbol" do
    GreenEggsAndSpam.options[:something] = 'nothing'
    assert_equal 'nothing', GreenEggsAndSpam.options['something']
  end
  
end