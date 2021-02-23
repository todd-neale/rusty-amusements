class AmusementsController < ApplicationController
  def index
    @amusements = Amusement.all
  end

  def show
    @amusement = Amusement.find(params[:id])
    @booking = Booking.new
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
    params.require(:amusement).permit(:name, :description, :price, photos: [])
  end
end
