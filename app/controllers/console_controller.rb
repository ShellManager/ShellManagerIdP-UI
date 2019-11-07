class ConsoleController < ApplicationController
  before_action :current_user
  before_action :current_session
end
