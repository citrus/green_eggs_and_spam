require 'green_eggs_and_spam/options'
require 'green_eggs_and_spam/action_controller'
require 'green_eggs_and_spam/active_record'
require 'green_eggs_and_spam/form_helper'

module GreenEggsAndSpam
  
  extend self
  
  # Returns the options hash
  def options
    @options ||= Options.new
  end
  
  # Returns the key index from the options hash
  def key_index
    options[:key_index]
  end
  
  # Returns a random key
  def random_key
    key_index.keys.sort_by{rand}.first
  end
  
  # Validates a key and answer combo
  def validates?(params) 
    params ||= {}   
    key = params[:key].to_s
    val = params[:answer].to_s
    return false if key.empty? || val.empty?
    answer = key_index[key.to_s]
    regex = Regexp.new(answer, 'i')
    return val.match(regex) != nil
  end
  
end