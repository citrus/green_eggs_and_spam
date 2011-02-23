class Egg < ActiveRecord::Base
  
  validates_presence_of :name
  
  validates_anti_spam
  
end