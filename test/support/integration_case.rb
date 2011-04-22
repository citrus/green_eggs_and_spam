# Define a bare test case to use with Capybara
class ActiveSupport::IntegrationCase < ActionController::IntegrationTest
  include Capybara
  include Rails.application.routes.url_helpers
end