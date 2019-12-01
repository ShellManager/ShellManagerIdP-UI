class FlowController < ApplicationController
  before_action :current_user
  before_action :current_session

  layout "error"
end
