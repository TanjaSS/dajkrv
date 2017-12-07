class UsersController < ApplicationController
  before_action :verify_user, only: [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Uspešno ste napravili nalog"
      session[:user_id] = @user.id
      redirect_to edit_settings_path
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :period)
    end
end
