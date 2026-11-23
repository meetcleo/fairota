require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  def sign_in
    visit login_url
    click_on "Sign in with Okta"
  end
end
