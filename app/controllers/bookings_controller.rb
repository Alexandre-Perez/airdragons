class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show]
  before_action :set_dragon, only: [:create, :new]

  def index
    @booking = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)

    @booking.dragon = @dragon
    @booking.user = @user
    if @booking.save
      redirect_to dragons_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end




  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_dragon
    @dragon = Dragon.find(params[:dragon_id])
  end
end
