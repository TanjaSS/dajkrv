class LoginsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:login][:email])
    if user.authenticate(params[:login][:password])
      session[:user_id] = user.id
    else
      flash[:danger] = "Prijava nije uspela"
      redirect_to root_path
    end
  end
end
