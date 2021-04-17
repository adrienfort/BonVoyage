class AlbumsController < ApplicationController

  def show
    @artist = Artist.find(params[:artist_id])
    @explorer = current_explorer
    @album = Album.find(params[:id])
  end

  def new
    @artist = current_artist
    @album = Album.new()
    @album.musics.build
  end

  def create
    @artist = current_artist
    @album = Album.new(album_params)
    @album.artist = @artist
    if !@album.save
      render :new and return
    end
    if params[:album][:musics_attributes] == nil || params[:album][:musics_attributes].values.count < 0
      @album.destroy
      flash[:alert] = "You must attach at least one music."
      render :new and return
    end
    params[:album][:musics_attributes].each do |key, value|
      music = Music.new(music_params(key))
      music.album = @album
      if !music.save
        @album.destroy
        flash[:alert] = "Invalid audio music."
        render :new and return
      end
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

  def music_params(index)
    params[:album][:musics_attributes].require("#{index}").permit(:name, :audio_file)
  end

end
