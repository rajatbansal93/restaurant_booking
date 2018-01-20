class ReservationsController < ApplicationController
  before_action :load_reservation, except: [:index, :create]
  before_action :load_guest, only: :create
  before_action :validate_table, only: :create
  before_action :validate_shift, only: :create

  def index
    respond_to do |format|
      format.json { render json: Reservation.all, include: [:guest, :table] }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @reservation, include: [:guest, :table] }
    end
  end


  def create
    @reservation = @guest.reservations.build(reservation_params)
    if @reservation.save
      render json: @reservation, include: [:guest, :table], status: :created
    else
      render json: { errors: @reservation.errors, include: [:guest, :table] }, status: :unprocessable_entity
    end
  end


  def update
    if @reservation.update(reservation_params)
      render json: @reservation, include: [:guest, :table], status: :ok
    else
      render json: { errors: @reservation.errors, include: [:guest, :table] }, status: :unprocessable_entity
    end
  end


  def destroy
    if @reservation.destroy
      render json: @reservation, include: [:guest, :table], status: :ok
    else
      render json: @reservation.errors.full_messages, include: [:guest, :table], status: :unprocessable_entity
    end
  end

  private

    def reservation_params
      params.require(:reservation).permit(:table_id, :time, :shift, :guest_count)
    end

    def load_reservation
      @reservation = Reservation.find(params[:id])
    end

    def load_guest
      @guest = Guest.find_by(email: params[:email])
      render json: { message: "No Such user exists" } and return unless @guest
    end

    def validate_table
      @table = Table.find_by(id: params[:reservation][:table_id])
      render json: { message: "No Such table at any restaurant exists" } and return unless @table
    end

    def validate_shift
      @shift = @table.restaurant.shifts.find_by_name(params[:reservation][:shift])
      render json: { message: "No Such shift exists" } and return unless @shift
    end
end
