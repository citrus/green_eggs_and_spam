Green Eggs and Spam
===================

A simple way to filter spam in your rails forms. GreenEggsAndSpam presents users with an easy question: **What color is this image?**

You'll supply the images and a key of which one's which. The gem will handle the rest.


Usage
-----

Install the gem just like you would any other:

    (sudo) gem install green_eggs_and_spam
    
    # or with bundler
    
    gem 'green_eggs_and_spam', '>= 0.1.1'
        

Create a handful of color coded images and name them something other than their color or design. `1.png`, `banana.png` or `firetruck.png` for example. Tell GreenEggsandSpam which ones which with an initializer:

    # config/initializers/green_eggs_and_spam.rb
    
    GreenEggsAndSpam.options[:key_index] = { "1" => "blue", "banana" => "yellow", "firetruck" => "red" }
    
    
Or just use the defaults, making your images `1.png`, `2.png`, `3.png`:

    { "1" => "red", "2" => "green", "3" => "blue" }
    

Include the helper in your form:

    = form_for @comment, :url => comment_path do |f|
      %p
        = f.label :comment
        = f.text_field :comment
        
      // Here's what your interested in:
      %p
        = anti_spam_form, "What color is this piece of bacon?"
       
        // the first optional argument is your custom question, the second is the form options hash
        
      = f.submit 'send'



Chances are your form is interacting with a model. If that's the case, hook up the validator to your model like so:

    class Egg < ActiveRecord::Base
      
      validates_anti_spam
      
    end
    


Next, setup your controller with the `has_anti_spam` method. This will prepare the controller and give you access to the helper methods.

    class EggsController < ApplicationController
      
      has_anti_spam
      
      ...
      
      def create

        # merge the antispam params into your model's params before validation
        @egg = Egg.new(params[:egg].merge(:antispam => params[:antispam]))
        
        # validate as usual
        if @egg.valid? && @egg.save
          # do something
        end
        
      end
      
    end



### That's it! 


But what if my form isn't validating a model? No big deal, just use the `anti_spam_valid?` helper method.
    
    class CommentsController < ApplicationController
      
      has_anti_spam
      
      ...
      
      # merge the antispam params into your model's params before validation
      def create
        
        # validate with the anti spam helper method
        if anti_spam_valid?
          # do something
        end
        
      end
      
    end
    




Customization
-------------

So you're using `.gif`'s or you're images aren't stored in `/images/antispam`. Here's some available options for the form helper.

    # the defaults
    {
      :alt => 'AntiSpam Image',
      :class => 'antispam-image',
      :path => '/images/antispam',
      :extension => 'jpg'
    }
    
    # usage
    anti_spam_form, "Your custom color question?", { :extension => 'png', :path => '/images' }
      
    # or set globally in your initializer
    
    GreenEggsAndSpam.options[:form_options] = { :extension => 'png', :path => '/images' }



Demo
----

If you'd like to see GreenEggsAndSpam in action, there is a demo app located in `test/dummy`.

    git://github.com/citrus/green_eggs_and_spam.git
    cd green_eggs_and_spam
    bundle install
    cd test/dummy
    rake db:migrate
    rails s



Testing
-------

The very limited Shoulda test suite can be run using `rake test` or just `rake`.

    git://github.com/citrus/green_eggs_and_spam.git
    cd green_eggs_and_spam
    rake
    
    
    
To Do
-----

* Write more tests
* Write more documentation
* Include default images

    
License
-------

Copyright (c) 2011 Spencer Steffen, released under the New BSD License All rights reserved.
