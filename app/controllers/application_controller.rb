class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize_view, :authorize_edit, :existing, :backpack_items, :total_weight, :weight_reset, :authorize_welcome_view


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

  def authorize_welcome_view
    if logged_in?
      redirect_to users_path
    end
  end


  def backpack_items
    Gear.where(id: session[:backpack])
  end

  def total_weight
    total = 0
    backpack_items.each do |g|
      total = total + g.weight
    end
  return total
  end

  def weight_reset
    total = 0
    return total
  end



end
