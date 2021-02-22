class AmusementsController < ApplicationController
  def index
    @amusements = Amusement.all
  end

  def show
    @amusement = Amusement.find(params[:id])
  end

  def new
  end

  def update
  end
end
