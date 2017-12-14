class Admin::UsersController < ApplicationController
  before_action :verify_user
  before_action :verify_admin

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "Korisnik je uspešno obrisan"
    redirect_to admin_users_path
  end

  private

    def verify_admin
      unless current_user.admin?
        render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
      end
    end
end
