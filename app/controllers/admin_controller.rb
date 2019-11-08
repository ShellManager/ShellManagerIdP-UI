class AdminController < ApplicationController
    before_action :current_user
    before_action :current_session
    before_action :current_admin
end
