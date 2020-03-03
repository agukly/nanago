class BookingsController < ApplicationController
  def index
  end

  def new

  end

  def create
    @booking.user = current_user
  end

  def show
    @booking = Booking.find(params[:id])
  end

end
