class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show]
  before_action :set_user, only: [:show, :create, :new]

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
    redirect_to dragons_path
    # @booking = Booking.new(booking_params)
    # @booking.user = @user
    # @booking.dragon = @user.dragons.first
    # raise
    # if @booking.save
    #
    # else
    #   render :new
    # end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :dragon_id, :start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
