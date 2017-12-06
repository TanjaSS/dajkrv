class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ApplicationHelper

  private

  def verify_user
    unless user_signed_in?
      redirect_to new_login_path
      return
    end
  end
end
