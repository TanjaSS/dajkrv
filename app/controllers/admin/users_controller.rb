class Admin::UsersController < ApplicationController
  before_action :verify_user, only: [:index]

  def index
    @users = User.all
  end
end
