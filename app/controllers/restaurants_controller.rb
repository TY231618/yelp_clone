class RestaurantsController < ApplicationController

before_action :authenticate_user!, :except => [:index, :show]

  def index
    if user_signed_in?
      @current_user_id = current_user.id

    end

    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  # @current_user = User.find(params[:current_user])


  def create
    @current_user = current_user
    @restaurant = @current_user.restaurants.create(restaurant_params)
    if @restaurant.save
      redirect_to '/restaurants'
    else
      render 'new'
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :image)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)

    redirect_to '/restaurants'
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = "#{@restaurant.name} deleted successfully"

    redirect_to '/restaurants'
  end
end
