class ArtistsController < ApplicationController

  def dashboard
    @artist = Artist.find(params[:id])
  end

  def show
    @explorer = current_explorer
    @artist = Artist.find(params[:id])
  end

end
