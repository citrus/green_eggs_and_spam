module GreenEggsAndSpam

  class Options < Hash
  
    # Initializes the options hash with the defaults
    def initialize
      super
      default!
    end
    
    # Clears current options and resets to the defaults
    def default!
      clear.merge!(defaults)
    end
    
    # The default options hash
    def defaults
      {
        :key_index => { "1" => "red", "2" => "green", "3" => "blue" },
        :form_options => { :alt => 'AntiSpam Image', :class => 'antispam-image', :path => '/images/antispam', :extension => 'png' },
        :error_message => "Spam Detected! Please make sure you've properly answered the anti spam question."
      }
    end
    
    # Sets and option and converts its key to a symbol
    def []=(key, value)
      key = key.to_sym
      case key
        when :key_index
          raise "Invalid Key Index" unless value.is_a?(Hash) && 1 < value.keys.length
        when :form_options
          raise "Invalid Form Options" unless value.is_a?(Hash)
          value = fetch(:form_options).merge(value)
      end
      super(key, value)
    end
    
    # Turns the key into a symbol and returns the requested value
    def [](key)
      super(key.to_sym)
    end
    
  end
  
end