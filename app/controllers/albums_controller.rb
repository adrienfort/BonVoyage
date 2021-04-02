class AlbumsController < ApplicationController

  def show
    @artist = Artist.find(params[:artist_id])
    @explorer = current_explorer
    @album = Album.find(params[:id])
  end

  def new
    @artist = current_artist
    @album = Album.new()
  end

  def create
    # Create an album
    @artist = current_artist
    @album = Album.new(album_params)
    @album.artist = @artist
    if !@album.save
      render :new
    end
    # Create a music
    # @music = Music.new(name: params[:album][:musics][:name], album: @album)
    # @file = open(params[:album][:musics][:audio_file])
    # @music.audio_file.attach(io: file, filename: "audio-music-name", content_type: "audio/mpeg")
    @music = Music.new(music_params)
    @music.album = @album
    if !@music.save
      @album.destroy
      render :new
    end
    redirect_to dashboard_artist_path(@artist)
  end

  def edit
    @artist = current_artist
    @album = Album.find(params[:id])
  end

  def update
    @artist = current_artist
    @album = Album.find(params[:id])
    @album.update(album_params)

    redirect_to artist_album_path(@artist, @album)
  end

  def destroy
    @artist = current_artist
    @album = Album.find(params[:id])
    @album.photo.purge
    @album.destroy

    redirect_to dashboard_artist_path(@artist)
  end

  private

  def album_params
    params.require(:album).permit(:name, :meaning, :photo, musics: [])
  end

  def music_params
    params[:album].require(:musics).permit(:name, :audio_file)
  end

end
