class PlaylistMusicsController < ApplicationController

  def new
    @explorer = current_explorer
    @music = Music.find(params[:music_id])
    @playlist_music = PlaylistMusic.new()
  end

  def create
    @explorer = current_explorer
    @playlist = Playlist.find(params[:playlist_music].values.first)
    @music = Music.find(params[:music_id])
    @playlist_music = PlaylistMusic.new(playlist_id: @playlist.id, music_id: @music.id)

    @playlist_music.save!
    redirect_to dashboard_explorer_path(@explorer)
  end

  def destroy
    @explorer = current_explorer
    @playlist = Playlist.find(params[:id])

    @playlist.destroy
    redirect_to dashboard_explorer_path(@explorer)
  end

end
