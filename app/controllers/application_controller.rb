class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize_view, :authorize_edit, :existing


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorize_view
    if logged_in? == false
      redirect_to root_path
    end
  end

  def authorize_edit
    @gear = Gear.find(params[:id])
    if current_user != @gear.user
      redirect_to gear_path(@gear.id)
    end
  end

  

end
