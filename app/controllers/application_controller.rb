class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin
    unless current_user.is_admin?
      flash[:error] = "Administrator rights needed"
      redirect_to root_path
    end
  end

end
