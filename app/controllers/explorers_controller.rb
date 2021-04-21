class ExplorersController < ApplicationController

  def dashboard
    @explorer = Explorer.find(params[:id])
    @fan_artists = @explorer.fan_artists
    @fan_albums = @explorer.fan_albums
    @fan_musics = @explorer.fan_musics
    @playlists = @explorer.playlists
  end

  def research
    @explorer = current_explorer
  end

end
