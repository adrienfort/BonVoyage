class PlaylistsController < ApplicationController

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new()
  end

  def create
    explorer = current_explorer
    @playlist = Playlist.new(playlist_params)
    @playlist.explorer = explorer
    if @playlist.save
      redirect_to dashboard_explorer_path(explorer)
    else
      render :new
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])
    @playlist.update(playlist_params)

    redirect_to dashboard_explorer_path(current_explorer)
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy

    redirect_to dashboard_explorer_path(current_explorer)
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end

end
