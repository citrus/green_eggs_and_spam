require 'helper'

class TestGreenEggsAndSpam < Test::Unit::TestCase
  
  should "get key index" do
    assert GreenEggsAndSpam.key_index.is_a?(Hash)
  end
  
  should "set key index" do
    index = { "1" => "green", "2" => "pink" }
    assert GreenEggsAndSpam.options[:key_index] = index
    assert_equal "green", GreenEggsAndSpam.key_index["1"]
    assert_equal "pink", GreenEggsAndSpam.key_index["2"]
  end
  
  should "validate key index" do
    assert_raises RuntimeError do |e|
      GreenEggsAndSpam.options[:key_index] = {}
      asset_equal "InvalidKeyIndex", e.message
    end
    assert_raises RuntimeError do |e|
      GreenEggsAndSpam.options[:key_index] = "some string"
      asset_equal "InvalidKeyIndex", e.message
    end
  end
  
  should "validate form options" do
    assert_raises RuntimeError do |e|
      GreenEggsAndSpam.options[:form_options] = "some string"
      asset_equal "InvalidKeyIndex", e.message
    end
  end
  
  should "merge default and new form options" do
    GreenEggsAndSpam.options[:form_options] = { :extension => "png" }
    assert GreenEggsAndSpam.options[:form_options].keys.include?(:alt)
    assert GreenEggsAndSpam.options[:form_options].keys.include?(:class)
    assert GreenEggsAndSpam.options[:form_options].keys.include?(:path)
  end
  
  should "set key index to things other than numbers" do
    index = { "lime" => "green", "grapefruit" => "pink" }
    GreenEggsAndSpam.options[:key_index] = index
    assert_equal "green", GreenEggsAndSpam.key_index["lime"]
    assert_equal "pink", GreenEggsAndSpam.key_index["grapefruit"]
  end

  should "generate a random key" do
    key = GreenEggsAndSpam.random_key
    assert GreenEggsAndSpam.key_index.include?(key)
  end

end