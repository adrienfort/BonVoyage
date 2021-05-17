class PlaylistsController < ApplicationController
  before_action :authenticate_explorer!, only: [:new, :create]
  before_action :get_explorer, only: [:show, :new, :create]
  before_action :get_and_authorize_playlist, only: [:show]

  def pundit_user
    current_explorer
  end

  def show
    @playlist_musics = @playlist.playlist_musics
    # @playlist_music = PlaylistMusic.new()
  end

  def new
    # @playlist = Playlist.new()
    # authorize @playlist
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.explorer = @explorer
    authorize @playlist
    if @playlist.save
      if !@playlist.photo.attached?
        file = open("#{Rails.root.to_s}/app/assets/images/default-playlist-picture.jpg")
        @playlist.photo.attach(io: file, filename: 'default-playlist-bonvoyage-picture.jpg', content_type: 'image/jpg')
      end
      redirect_to dashboard_explorer_path(@explorer)
    else
      render :new
    end
  end

  def edit
    @explorer = current_explorer
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])
    @playlist.update(playlist_params)

    redirect_to dashboard_explorer_path(current_explorer)
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.photo.purge
    @playlist.destroy

    redirect_to dashboard_explorer_path(current_explorer)
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, :photo)
  end

  def get_explorer
    @explorer = current_explorer
  end

  def get_and_authorize_playlist
    @playlist = Playlist.find(params[:id])
    authorize @playlist
  end
end
