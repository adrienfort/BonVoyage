class PlaylistMusicsController < ApplicationController
  before_action :authenticate_explorer!
  before_action :get_explorer

  def pundit_user
    current_explorer
  end

  def new
    @playlist_music = PlaylistMusic.new()
    @music = Music.find(params[:music_id])
    authorize @playlist_music
  end

  def create
    @playlist = Playlist.find(params[:playlist_music].values.first)
    @music = Music.find(params[:music_id])
    @playlist_music = PlaylistMusic.new(playlist_id: @playlist.id, music_id: @music.id)
    authorize @playlist_music

    if @playlist.playlist_musics.where(music_id: @music.id, playlist_id: @playlist).count == 0
      @playlist_music.save!
    end
    # redirect_to dashboard_explorer_path(@explorer)
  end

  def destroy
    @playlist = Playlist.find(params[:playlist_id])
    @playlist_music = PlaylistMusic.find(params[:id])
    authorize @playlist_music

    @playlist_music.destroy
    redirect_back(fallback_location: explorer_playlist_path(@explorer, @playlist))
  end

  private

  def get_explorer
    @explorer = current_explorer
  end

end
