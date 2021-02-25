class AmusementsController < ApplicationController
  def index
    @amusements = Amusement.all
    raise

    @markers = @amusements.geocoded.map do |amusement|
      {
        lat: amusement.latitude,
        lng: amusement.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { amusement: amusement })
      }
    end
  end

  def show
    @amusement = Amusement.find(params[:id])
    @booking = Booking.new
    @reviews = @amusement.reviews
    if @amusement.bookings.map { |boo| boo.user }.include? current_user
      @booking_for_review = Booking.where(amusement: @amusement, user: current_user)[0]
      @review = Review.new
    end
  end

  def new
    @amusement = Amusement.new
  end

  def create
    @amusement = Amusement.new amusement_params
    @amusement.user = current_user
    if @amusement.save
      redirect_to amusement_path(@amusement)
    else
      render :new
    end
  end

  def edit
    @amusement = Amusement.find(params[:id])
  end

  def update
    @amusement = Amusement.find(params[:id])
    @amusement.update amusement_params
    redirect_to amusement_path(@amusement)
  end

  def destroy
    @amusement = Amusement.find(params[:id])
    @amusement.destroy

    redirect_to amusements_path
  end

  private

  def amusement_params
    params.require(:amusement).permit(:name, :tagline, :description, :address, :price, :deathcount, :size, :category, :haskilledanimals, :washingmachine, :childunfriendly, :heightrestriction, :haunting, :illegal, photos: [])
  end
end
