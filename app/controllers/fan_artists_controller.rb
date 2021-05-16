class FanArtistsController < ApplicationController
  before_action :get_explorer_and_artist, only: [:create, :destroy]

  def pundit_user
    current_explorer
  end

  def create
    @fan_artist = FanArtist.new(explorer: @explorer, artist: @artist)
    authorize @fan_artist

    @fan_artist.save!
    redirect_back(fallback_location: explorer_artist_path(@explorer, @artist))
  end

  def destroy
    @fan_artist = FanArtist.find(params[:id])
    authorize @fan_artist

    @fan_artist.destroy
    redirect_back(fallback_location: explorer_artist_path(@explorer, @artist))
  end

  private

  def get_explorer_and_artist
    @explorer = current_explorer
    @artist = Artist.find(params[:artist_id])
  end

end
