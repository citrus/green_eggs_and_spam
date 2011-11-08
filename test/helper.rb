# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

gem "minitest"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
require "minitest/autorun"
require "minitest/should"

Rails.backtrace_cleaner.remove_silencers!

# Run any available migration
ActiveRecord::Migrator.migrate File.expand_path("../dummy/db/migrate/", __FILE__)
