class ArtistsController < ApplicationController

  def dashboard
    @artist = Artist.find(params[:id])
  end

  def show
    @artist = Artist.find(params[:id])
  end

end
