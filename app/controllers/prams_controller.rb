class PramsController < ApplicationController
  before_action :set_pram, only: [:show, :destroy]

   def index
    @prams = policy_scope(Pram).select { |pram| pram.latitude != nil && pram.longitude != nil }

    @markers = @prams.map do |pram|
      {
        lat: pram.latitude,
        lng: pram.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pram: pram })
      }
    end
  end

  def show
    authorize @pram
  end

  def new
    @pram = Pram.new
    authorize @pram
  end

  def create
    @pram = Pram.new(pram_params)
    @pram.user = current_user
    authorize @pram
    if @pram.save
      redirect_to @pram, notice: 'Pram was successfully created.'
    else
      render :new
    end
  end

  def destroy
    authorize @pram
    @pram.destroy
    redirect_to pram_url, notice: 'Pram was successfully deleted.'
  end

  private

  def set_pram
    @pram = Pram.find(params[:id])
  end

  def pram_params
    params.require(:pram).permit(:brand, :model, :location, :year, :description, :price, photos: [])
  end
end
