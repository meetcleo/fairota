ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:okta] = OmniAuth::AuthHash.new(
  provider: "okta",
  uid: "test-user",
  info: { email: "test.user@meetcleo.com" }
)

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  def sign_in
    post "/auth/okta"
    follow_redirect!
  end
end
