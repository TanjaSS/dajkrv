class LoginsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:login][:email])
    if user.authenticate(params[:login][:password])
      session[:user_id] = user.id
    end
  end
end
