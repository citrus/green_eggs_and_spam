require 'helper'

class TestNavigation < ActiveSupport::IntegrationCase

  def setup
    GreenEggsAndSpam.options.default!
    @b = Watir::Browser.new
  end

  should "be a rails app" do
    assert_kind_of Dummy::Application, Rails.application
  end
  
  should "visit the homepage" do
    @b.goto("http://localhost:3000/")
    
    assert @b.link(:text, "play with eggs").exist?
    assert @b.link(:text, "send a comment").exist?
    
    assert @b.link(:text, "new egg").exist?
  end
  
  context "on the new egg page" do
  
    setup do    
      @b.goto("http://localhost:3000/eggs/new")  
    end
  
    should "fail validation on new egg" do
      @b.text_field(:name, "egg[name]").set ""
      @b.button(:value, "Create Egg").click
      assert @b.text.include?("Egg could not be saved")
      assert @b.text.include?("Name can't be blank")
    end
    
    should "fail anti spam on new egg" do
      @b.text_field(:name, "egg[name]").set "Watir Color"
      @b.button(:value, "Create Egg").click
      assert @b.text.include?("Egg could not be saved")
      assert @b.text.include?("Spam Detected")
    end
    
    should "create new egg" do
      @b.text_field(:name, "egg[name]").set "Watir Color"
      
      key = @b.hidden_field(:name, "antispam[key]").value
      answer = GreenEggsAndSpam.key_index.fetch(key)
      
      @b.text_field(:name, "antispam[answer]").set answer
      
      @b.button(:value, "Create Egg").click
      assert @b.text.include?("Egg successfully created")
      assert @b.text.include?("Watir Color")
    end

  end
  
end