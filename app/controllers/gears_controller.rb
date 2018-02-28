class GearsController < ApplicationController
  before_action :authorize_view
  before_action :authorize_edit, only: [:edit, :update]
  
  def index
    @gears = Gear.all
  end

  def show
    @gear = Gear.find(params[:id])
  end

  def new 
    @user = current_user
    @gear = @user.gears.new
    
  end

  def create
    @user = current_user
    @gear = @user.gears.new(gear_params)
    @gear.save
    redirect_to gear_path(@gear.id)
  end

  def edit
    @gear = Gear.find(params[:id])
  end

  def update
    @user = current_user
    @gear = Gear.find(params[:id])
    # @gear.name = params[:gear][:name]
    # @gear.save

    @gear.update(gear_params)
    redirect_to gear_path(@gear.id)

  end

  def destroy
  end

  


  private
  def gear_params
    return params.require(:gear).permit(:name, :brand, :weight, :pricing, :personal_review)
  end

end
