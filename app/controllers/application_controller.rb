class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def require_login
    return if session[:email]

    session[:return_to] = request.fullpath if request.get?
    redirect_to login_path
  end
end
