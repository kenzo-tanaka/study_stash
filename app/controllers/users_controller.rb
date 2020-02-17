class UsersController < ApplicationController
  before_action :check_user_session

  def login; end

  private

  def check_user_session
    redirect_to root_path, notice: '既にログイン済みです' if user_signed_in?
  end
end