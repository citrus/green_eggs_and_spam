module GreenEggsAndSpam

  module AntiSpamFormHelper

    def anti_spam_form(question="What color is this?", options={})
      key = @antispam_key || 0
      options = { :alt => 'AntiSpam Image', :class => 'antispam-image', :path => '/images/antispam', :extension => 'jpg' }.merge(options)
      choices = GreenEggsAndSpam::AntiSpam.key_index.values.to_a
      choices[choices.length - 1] = "or #{choices.last}"
      raw([
        label_tag(:antispam, question),
        tag(:br),          
      	text_field_tag(:antispam, '', :class => 'text required', :title => choices.join(", ")),
      	hidden_field_tag(:antispam_key, key),
        tag(:br, :class => 'clear'),
      	image_tag(File.join(options[:path], "#{key}.#{options[:extension]}"), :alt => options[:alt], :class => options[:class])
      ].join("\n"))
    end
  
  end
  
end