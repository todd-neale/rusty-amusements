class AmusementsController < ApplicationController
  def index
    @amusements = Amusement.all
  end

  def show
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

  private

  def amusement_params
    params.require(:amusement).permit(:name, :description, :price, photos: [])
  end
end
