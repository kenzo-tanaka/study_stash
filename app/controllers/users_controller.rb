class UsersController < ApplicationController
  before_action :check_user_session, only: :login
  before_action :set_user, only: :show
  def login; end

  def show; end

  private

  def set_user
    @user = User.includes(schedules: :study_language).find(params[:id])
  end

  def check_user_session
    redirect_to root_path, notice: '既にログイン済みです' if user_signed_in?
  end
end