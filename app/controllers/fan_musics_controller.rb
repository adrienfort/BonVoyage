class FanMusicsController < ApplicationController

  def create
    @explorer = current_explorer
    @music = Music.find(params[:music_id])
    @fan_music = FanMusic.new(explorer: @explorer, music: @music)

    @fan_music.save!
    # remplacer le fallback location actuel par la playlist "Bon Voyage" !!!
    redirect_back(fallback_location: explorer_artist_album_path(@explorer, @music.album.artist, @music.album))
  end

  def destroy
    @explorer = current_explorer
    @music = Music.find(params[:music_id])
    @fan_music = FanMusic.find(params[:id])

    @fan_music.destroy
    # remplacer le fallback location actuel par la playlist "Bon Voyage" !!!
    redirect_back(fallback_location: explorer_artist_album_path(@explorer, @music.album.artist, @music.album))
  end

end
