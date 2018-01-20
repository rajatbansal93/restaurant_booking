class RestaurantsController < ApplicationController
  before_action :load_restaurant, except: [:index, :create]

  def index
    respond_to do |format|
      format.json { render json: Restaurant.all, include: [:shifts, :tables] }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @restaurant, include: [:shifts, :tables] }
    end
  end


  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      render json: @restaurant, include: [:shifts, :tables], status: :created
    else
      render json: { errors: @restaurant.errors, include: [:shifts, :tables] }, status: :unprocessable_entity
    end
  end

  def edit
    render json: @restaurant
  end

  def update
    if @restaurant.update(restaurant_params)
      render json: @restaurant, include: [:shifts, :tables], status: :ok
    else
      render json: { errors: @restaurant.errors, include: [:shifts, :tables] }, status: :unprocessable_entity
    end
  end


  def destroy
    if @restaurant.destroy
      render json: @restaurant, include: [:shifts, :tables], status: :ok
    else
      render json: @restaurant.errors.full_messages, include: [:shifts, :tables], status: :unprocessable_entity
    end
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :email,
        :phone, shifts_attributes: [:id, :name, :opening_time, :closing_time],
        tables_attributes: [:id, :name, :min_guest, :max_guest])
    end

    def load_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
end
