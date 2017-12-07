class Admin::UsersController < ApplicationController
  before_action :verify_user
  before_action :verify_admin

  def index
    @users = User.all
  end

  private

    def verify_admin
      unless current_user.admin?
        render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
      end
    end
end
