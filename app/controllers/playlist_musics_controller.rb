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

    if @playlist.playlist_musics.where(music_id: @music.id, playlist_id: @playlist).count == 0
      @playlist_music.save!
    end
    redirect_to dashboard_explorer_path(@explorer)
  end

  def destroy
    @explorer = current_explorer
    @playlist = Playlist.find(params[:playlist_id])
    @playlist_music = PlaylistMusic.find(params[:id])

    @playlist_music.destroy
    redirect_to explorer_playlist_path(@explorer, @playlist)
  end

end
