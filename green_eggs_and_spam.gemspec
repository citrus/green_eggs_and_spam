# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "green_eggs_and_spam/version"

Gem::Specification.new do |s|
  s.name        = "green_eggs_and_spam"
  s.version     = GreenEggsAndSpam::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Spencer Steffen"]
  s.email       = ["spencer@citrusme.com"]
  s.homepage    = ""
  s.summary     = %q{A simple way to filter spam in your rails forms.}
  s.description = %q{Green eggs and spam presents the user with a simple question: What color is this image? You'll supply the images and a key of which one's which, and the gem will help with the rest.}

  s.rubyforge_project = "green_eggs_and_spam"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency("rails", ">= 3.0.0")
  
  s.add_development_dependency("shoulda", ">= 2.11.3")
  s.add_development_dependency("sqlite3", ">= 1.3.3")
  s.add_development_dependency("capybara", ">= 0.4.0")
  s.add_development_dependency("commonwatir", ">= 1.7.1")
  s.add_development_dependency("safariwatir", ">= 0.4.0")
  
end