class AmusementsController < ApplicationController
  def index
    @amusements = Amusement.all
  end

  def show
  end

  def new
  end

  def update
  end
end
