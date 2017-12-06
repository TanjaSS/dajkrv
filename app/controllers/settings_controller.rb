class SettingsController < ApplicationController
  def edit
    unless user_signed_in?
      redirect_to new_login_path
      return
    end

    @user = current_user
  end

  def update
    @user = current_user
    @user.update!(user_params)
    flash.now[:success] = "Uspešno ste sačuvali podešavanja"
    render :edit
  end

  private

    def user_params
      params.require(:user).permit(:period, :last_donation_at)
    end
end
