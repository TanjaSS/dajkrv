class SettingsController < ApplicationController
  before_action :verify_user

  def edit
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
