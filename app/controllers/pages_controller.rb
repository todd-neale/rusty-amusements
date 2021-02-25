class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @amusements = Amusement.limit(3)
  end
end
