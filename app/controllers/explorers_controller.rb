class ExplorersController < ApplicationController

  def dashboard
    @explorer = Explorer.find(params[:id])
    @fan_artists = @explorer.fan_artists
    @albums = @explorer.albums
    @playlists = @explorer.playlists
  end

end
