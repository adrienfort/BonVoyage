class ArtistsController < ApplicationController
  before_action :authenticate_artist!
  before_action :get_artist, only: [:dashboard, :show]

  def pundit_user
    current_artist
  end

  def dashboard
  end

  def show
    @explorer = current_explorer
  end

  private

  def get_artist
    @artist = Artist.find(params[:id])
    authorize @artist
  end

end
