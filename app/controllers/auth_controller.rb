class AuthController < ApplicationController
  before_action :home_if_logged_in, except: :logout
  def build_user
    session[:user_json] = request.raw_post
  end

  def logout
    reset_session
    redirect_to login_path
  end
end
