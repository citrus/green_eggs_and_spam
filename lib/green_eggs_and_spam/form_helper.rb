module GreenEggsAndSpam

  module AntiSpamFormHelper
    
    # Builds a label tag, text field and hidden field for use in a rails form
    def anti_spam_form(question="What color is this image?", options={})
      key = @antispam_key || 0
      options = GreenEggsAndSpam.options[:form_options].merge(options)
      choices = GreenEggsAndSpam.key_index.values.to_a
      choices[choices.length - 1] = "or #{choices.last}"
      [
        label_tag('antispam[answer]', question, :class => 'antispam-label'),  
      	text_field_tag('antispam[answer]', '', :class => 'antispam-field text required', :title => choices.join(", ")),
      	hidden_field_tag('antispam[key]', key, :class => 'hidden'),
      	image_tag(File.join(options[:path], "#{key}.#{options[:extension]}"), :alt => options[:alt], :class => options[:class])
      ].join("\n").html_safe
    end
  
  end
  
end