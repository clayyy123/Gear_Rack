class SessionsController < ApplicationController

def new

end

  def create
    @user = User.find_by_email(params[:email])
      if @user and @user.authenticate(params[:password])
        session[:user_id] = @user.id
        if !session[:backpack]
          session[:backpack] = []
        end
        redirect_to "/users"
      else
        redirect_to new_session_path
      end
  end

  def destroy
    session[:user_id] = nil
    session[:backpack] = []
    redirect_to root_path
  end
end
