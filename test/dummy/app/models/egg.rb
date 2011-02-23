class Egg < ActiveRecord::Base
  
  validates_presence_of :color
  
  validates_anti_spam
  
end