class GearsController < ApplicationController
  before_action :authorize_view
  before_action :authorize_edit, only: [:edit, :update]
  
  def index
    @gears = Gear.all
    @gears_order = Gear.all.order("created_at DESC")
    @gears_name = Gear.all.order("name ASC")
    @gears_pricing = Gear.all.order("pricing ASC")
    @gears_pricing_desc = Gear.all.order("pricing DESC")
  end

  # def name_view
  #   @gears = Gear.where()
  # end



  

  def show
    @gear = Gear.find(params[:id])
    p session[:backpack]
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
    @user = current_user
    @gear = Gear.find(params[:id])
    @gear.destroy
    redirect_to "/users/#{@user.id}"
  end

  
  def add_to_backpack
    session[:backpack].push(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def clear_backpack
    session[:backpack] = []
    redirect_back(fallback_location: root_path)
  end
  

  private
  def gear_params
    return params.require(:gear).permit(:name, :brand, :weight, :pricing, :personal_review, :image_url)
  end

end
