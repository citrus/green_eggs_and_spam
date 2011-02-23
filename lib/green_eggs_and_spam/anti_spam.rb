module GreenEggsAndSpam
  module AntiSpam
    
    extend self
    
    def key_index
      @key_index ||= { "1" => "blue", "2" => "green", "3" => "red" }
    end
    
    def key_index=(value)
      @key_index = value
    end
    
    def random_key
      rand(key_index.keys.length) + 1    
    end
    
    def valid?(params={})    
      puts "valid?"
      puts params.inspect
      key = params[:antispam_key].to_s
      val = params[:antispam].to_s
      return false if key.empty? || val.empty?
      answer = key_index[key.to_s]
      regex = Regexp.new(answer, 'i')
      return val.match(regex) != nil
    end

  end
  
end