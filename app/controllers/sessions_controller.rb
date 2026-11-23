class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    return_to = session[:return_to]
    reset_session
    session[:email] = request.env["omniauth.auth"].info.email

    redirect_to return_to || root_path
  end

  def failure
    redirect_to login_path, alert: "Sign in failed, please try again."
  end
end
