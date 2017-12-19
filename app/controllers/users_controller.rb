class UsersController < ApplicationController

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

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session.delete(:user_id)
    flash[:success] = "Uspešno ste obrisali nalog"
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :period)
    end
end
