class RestaurantsController < ApplicationController
  before_action :load_restaurant, except: :index

  def index
    respond_to do |format|
      format.json { render json: Restaurant.all }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @restaurant }
    end
  end


  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      render json: @restaurant, status: :created
    else
      render json: { errors: @restaurant.errors }, status: :unprocessable_entity
    end
  end

  def edit
    render json: @restaurant
  end

  def update
    if @restaurant.update(restaurant_params)
      render json: @restaurant, status: :ok
    else
      render json: { errors: @restaurant.errors }, status: :unprocessable_entity
    end
  end


  def destroy
    if @restaurant.destroy
      render json: @restaurant, status: :ok
    else
      render json: @restaurant.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :email,
        :phone, shifts_attributes: [:name, :opening_time, :closing_time])
    end
end
