class PagesController < ApplicationController

 before_action :authorize_welcome_view, only: :index
  def index
  end

  def show
    
  end


  def clear_backpack
    session[:backpack] = []
    redirect_to users_path
  end
end
