class FanArtistsController < ApplicationController

  def create
    @explorer = current_explorer
    @artist = Artist.find(params[:artist_id])
    @fan_artist = FanArtist.new(explorer: @explorer, artist: @artist)

    @fan_artist.save!
    redirect_back(fallback_location: explorer_artist_path(@explorer, @artist))
  end

  def destroy
    @explorer = current_explorer
    @artist = Artist.find(params[:artist_id])
    @fan_artist = FanArtist.find(params[:id])

    @fan_artist.destroy
    redirect_back(fallback_location: explorer_artist_path(@explorer, @artist))
  end

end
