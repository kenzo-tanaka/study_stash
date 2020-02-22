class Admin::ApplicationController < ApplicationController
  before_action :check_admin_user
  private
  def check_admin_user
    redirect_to root_path unless current_user&.admin?
  end
end
