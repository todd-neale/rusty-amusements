class AmusementsController < ApplicationController
  def index
    # @amusements = policy_scope(Amusement)
    if params[:query]
      @amusements = policy_scope(Amusement.index_search(params[:query]))
      @apology = "Sozza. No results for that search. Try 'dodgems'" if @amusements.empty?
    else
      @amusements = policy_scope(Amusement.all)
    end

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
    @new_review = Review.find params[:rev_id] if params[:rev_id]
    @reviews = @amusement.reviews.shuffle.first(5)
    if @new_review
      @reviews << @new_review unless @reviews.include? @new_review
    end
    if @amusement.bookings.map { |boo| boo.user }.include? current_user
      @booking_for_review = Booking.where(amusement: @amusement, user: current_user)[0]
      @review = Review.new
    end
    ratings = @amusement.reviews.map { |r| r.rating }
    @rating = ratings.empty? ? 0.00 : (ratings.sum(0.0) / ratings.size).round(2)
    authorize @amusement
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
    authorize @amusement
  end

  def update
    @amusement = Amusement.find(params[:id])
    authorize @amusement
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

  def rating(amusement)
    ratings = amusement.reviews.map { |r| r.rating }
    ratings.empty? ? 0.00 : (ratings.sum(0.0) / ratings.size).round(2)
  end
end
