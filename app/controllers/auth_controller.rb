class AuthController < ApplicationController
  def build_user
    session[:user_json] = request.raw_post
  end

  def logout
    reset_session
    redirect_to login_path
  end
end
