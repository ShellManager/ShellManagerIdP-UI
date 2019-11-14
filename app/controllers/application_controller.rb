class ApplicationController < ActionController::Base
  before_action :set_cache_headers
  helper_method :gravatar_url
  before_action :render_time


  def render_time
    @start_time = Time.now
  end

  def current_user
    @current_user ||= JSON.parse(session[:user_json], symbolize_names: true) if session[:user_json]
  end

  def current_session
    redirect_to "/account/login?returl=#{request.fullpath}", :only_path => true unless @current_user
  end

  def current_admin
    redirect_to "/console/account" unless @current_user[:permission_level] == 0
  end

  def home_if_logged_in
    redirect_to "/console/account" if session[:user_json]
  end

  def gravatar_url(email, size)
    gravatar = Digest::MD5::hexdigest(email).downcase
    url = "http://gravatar.com/avatar/#{gravatar}.png?s=#{size}"
  end

  def require_user
    redirect_to '/account/login' unless current_user
  end

  private

  def set_cache_headers
    response.headers['Cache-Control'] = 'no-cache, no-store'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
  end
end
