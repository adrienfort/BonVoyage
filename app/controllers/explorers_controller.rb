class ExplorersController < ApplicationController
  before_action :authenticate_explorer!
  # before_action :get_explorer, only: [:dashboard]

  def pundit_user
    current_explorer
  end

  def dashboard
    @explorer = Explorer.find(params[:id])
    @fan_artists = @explorer.fan_artists
    @fan_albums = @explorer.fan_albums
    @fan_musics = @explorer.fan_musics
    @playlists = @explorer.playlists
    authorize @explorer
  end

  def research
    @explorer = current_explorer
    authorize @explorer
  end

end
