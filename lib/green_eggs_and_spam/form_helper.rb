module GreenEggsAndSpam

  module AntiSpamFormHelper

    def anti_spam_form(question="What color is this image?", options={})
      key = @antispam_key || 0
      options = { :alt => 'AntiSpam Image', :class => 'antispam-image', :path => '/images/antispam', :extension => 'jpg' }.merge(options)
      choices = GreenEggsAndSpam::AntiSpam.key_index.values.to_a
      choices[choices.length - 1] = "or #{choices.last}"
      [
        label_tag(:antispam, question, :class => 'antispam-label'),
        tag(:br),          
      	text_field_tag(:antispam, '', :class => 'antispam-field text required', :title => choices.join(", ")),
      	hidden_field_tag(:antispam_key, key),
        tag(:br, :class => 'clear'),
      	image_tag(File.join(options[:path], "#{key}.#{options[:extension]}"), :alt => options[:alt], :class => options[:class])
      ].join("\n").html_safe
    end
  
  end
  
end