Green Eggs and Spam
===================

A simple way to filter spam in your rails forms. Green eggs and spam presents the user with a simple question: **What color is this image?**

You'll supply the images and a key of which one's which. The gem will handle the rest.


** ----- under development ----- **


Usage
-----

Install the gem just like you would any other:

    (sudo) gem install green_eggs_and_spam
    
    # or with bundler
    
    gem 'green_eggs_and_spam', '>= 0.1.0'
        

Create a handful of color coded images and name them `1.png`, `2.png`, etc. Tell Green Eggs and Spam which ones which with an initializer:

    # config/initializers/green_eggs_and_spam.rb
    
    GreenEggsAndSpam::AntiSpam.key_index = { "1" => "blue", "2" => "green", "3" => "red" }


In your controller:

    class CommentsController < ApplicationController
    
      has_anti_spam
      
      def create
        ... # your code
        
        # add an error unless the anti spam question was answered correctly
        @comment.errors[:base] << "Spam Detected! Please make sure you've properly answered the anti spam question." unless anti_spam_valid?        
        
        ... # the rest of your action
      end
      
    end
    
    
In your form:

    = form_for @comment, :url => comment_path do |f|
      %p
		    = f.label :comment
		    = f.text_field :comment
		    
	    // Here's what your interested in:
	    %p
	     = anti_spam_form, "What color is this piece of bacon?" # the optional argument is your custom question
        
		  = f.submit 'send'
		

Customization:

So you're using `.gif`'s or you don't want the images stored in `/images/antispam`. Here's some available options for the form helper.

    # the defaults
    {
      :alt => 'AntiSpam Image',
      :class => 'antispam-image',
      :path => '/images/antispam',
      :extension => 'jpg'
    }
    
    # usage
    anti_spam_form, "Your custom color question?", { :extension => 'png', :path => '/images' }
      


License
-------

Copyright (c) 2011 Spencer Steffen, released under the New BSD License All rights reserved.
