class AlbumsController < ApplicationController
  before_action :authenticate_artist!, only: [:new, :create, :show_artist]
  before_action :authenticate_explorer!, only: [:show_explorer]
  before_action :get_artist, only: [:new, :create, :edit, :update, :show_artist]
  before_action :get_explorer, only: [:show_explorer]
  before_action :get_and_authorize_album, only: [:edit, :update, :destroy, :show_artist, :show_explorer]

  def pundit_user
    current_artist
  end

  def show_explorer
  end

  def show_artist
  end

  def new
    @album = Album.new()
    @album.musics.build
    authorize @album
  end

  def create
    @album = Album.new(album_params)
    @album.artist = @artist
    authorize @album
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
  end

  def update
    @album.update(album_params)
    redirect_to dashboard_artist_path(@artist)
  end

  def destroy
    @artist = current_artist
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

  def get_artist
    @artist = current_artist
  end

  def get_explorer
    @explorer = current_explorer
  end

  def get_and_authorize_album
    @album = Album.find(params[:id])
    authorize @album
  end

end
