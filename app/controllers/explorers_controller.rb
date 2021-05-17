class ExplorersController < ApplicationController
  before_action :authenticate_explorer!
  before_action :get_and_authorize_explorer

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

  def rakings
    @artists = Artist.all.sort_by(&:nb_plays).reverse.first(30)
    @albums = Album.all.sort_by(&:nb_plays).reverse.first(30)
    @musics = Music.all.sort_by(&:nb_plays).reverse.first(30)
  end

  def research
  end

  private

  def get_and_authorize_explorer
    @explorer = current_explorer
    authorize @explorer
  end

end
