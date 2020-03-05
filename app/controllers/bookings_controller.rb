class BookingsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    @pram = Pram.find(params[:pram_id])
    @booking.pram = @pram

    if @booking.end_day && @booking.start_day
      total_price = (@booking.end_day - @booking.start_day).to_i * @booking.pram.price
      @booking.total_price = total_price
    else
      @booking.total_price = 0
    end

    if @booking.save

      redirect_to booking_path(@booking.id)
    else
      render 'prams/show'
    end
  end

  def show
    @pram = Pram.new
    @booking = Booking.find(params[:id])
    @review = Review.new
    authorize @booking

    @markers = [@booking.pram].map do |pram|
      {
        lat: pram.latitude,
        lng: pram.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pram: pram })
      }
    end
     #authorize @review -- no review policy yet
  end

  private

  def booking_params
    params.require(:booking).permit(:start_day, :end_day)
  end


end
