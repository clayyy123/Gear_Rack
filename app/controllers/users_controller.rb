class UsersController < ApplicationController
  before_action :authorize_view, except: [:new, :create]



  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to new_session_path
      else
        redirect_to new_user_path
      end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    @user.save
    redirect_to user_path
  end

  def destroy
  end

  # def add_to_backpack
    
  #   session[:backpack].push(params[:id])
  #   # redirect_to user_path(@user.id)
  #   redirect_back(fallback_location: root_path)
  # end

  # def clear_backpack
  #   session[:backpack] = []
  #   redirect_to users_path(params[:id])
  # end
    

  private
  def user_params
    return params.require(:user).permit(:name, :email, :image_url, :bio, :password, :password_confirmation)
  end
end
