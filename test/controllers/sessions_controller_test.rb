require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "redirects to login when signed out" do
    get rota_url(rotas(:one))
    assert_redirected_to login_url
  end

  test "returns to the requested page after signing in" do
    get rota_url(rotas(:one))
    sign_in
    assert_redirected_to rota_url(rotas(:one))
  end

  test "shows the login page when Okta sign in fails" do
    get auth_failure_url
    assert_redirected_to login_url
  end
end
