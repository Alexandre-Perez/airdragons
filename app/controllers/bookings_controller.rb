class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show create]

  def index
    @booking = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def show
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :dragon_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
