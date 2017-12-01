class LoginsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:login][:email])
    if user && user.authenticate(params[:login][:password])
      session[:user_id] = user.id
      flash[:success] = "Uspešno ste se prijavili"
      redirect_to edit_settings_path
    else
      flash[:danger] = "Prijava nije uspela"
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Uspešno ste se odjavili"
    redirect_to root_path
  end
end
