class ExplorersController < ApplicationController
  before_action :authenticate_explorer!
  before_action :get_and_authorize_explorer, only: [:dashboard, :research]

  def pundit_user
    current_explorer
  end

  def dashboard
    @fan_artists = @explorer.fan_artists
    @fan_albums = @explorer.fan_albums
    @fan_musics = @explorer.fan_musics
    @playlists = @explorer.playlists
    @playlist = Playlist.new()
  end

  def research
  end

  private

  def get_and_authorize_explorer
    @explorer = current_explorer
    authorize @explorer
  end

end
