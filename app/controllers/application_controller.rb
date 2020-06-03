class ApplicationController < ActionController::Base
  include Pundit
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
  end
end
