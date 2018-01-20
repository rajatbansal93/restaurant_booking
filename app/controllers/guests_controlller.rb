class GuestsController < ApplicationController
  before_action :load_guest, except: :index

  def index
    respond_to do |format|
      format.json { render json: Guest.all }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @guest }
    end
  end


  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      render json: @guest, status: :created
    else
      render json: { errors: @guest.errors }, status: :unprocessable_entity
    end
  end

  def edit
    render json: @guest
  end

  def update
    if @guest.update(guest_params)
      render json: @guest, status: :ok
    else
      render json: { errors: @guest.errors }, status: :unprocessable_entity
    end
  end


  def destroy
    if @guest.destroy
      render json: @guest, status: :ok
    else
      render json: @guest.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

    def guest_params
      params.require(:guest).permit(:name, :email)
    end
end
