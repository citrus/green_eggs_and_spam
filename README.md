Green Eggs and Spam
===================

A simple way to filter spam in your rails forms. Green eggs and spam presents the user with a simple question: **What color is this?**

You'll supply the images and a key of which one's which. The gem will handle the rest.

** ----- under development ----- **


Usage
-----

Create a handful of color coded images and name them 1.png, 2.png, etc. Tell Green Eggs and Spam which ones which with an initializer:

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
		  


License
-------

Copyright (c) 2011 Spencer Steffen, released under the New BSD License All rights reserved.
