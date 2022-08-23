class BookingsController < ApplicationController
  before_action :set_list, only: [:show, :create,]

  def index
    @booking = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.new
    @review = Review.new(list: @list)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.list = @list
    if @booking.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :dragon_id)
  end

  def set_list
    @list = List.find(params[:id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
