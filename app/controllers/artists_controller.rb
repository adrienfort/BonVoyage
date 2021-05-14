class ArtistsController < ApplicationController
  before_action :authenticate_artist!, only: [:dashboard]
  before_action :get_and_authorize_artist, only: [:dashboard]
  before_action :authenticate_explorer!, only: [:show]

  def pundit_user
    current_artist
  end

  def dashboard
    @nb_artists = Artist.all.count
    @plays_pos = Artist.all.select{ |artist| artist.plays.count > @artist.plays.count}.count
    @fans_pos = Artist.all.select{ |artist| artist.fan_artists.count > @artist.fan_artists.count}.count
  end

  def show
    @explorer = current_explorer
    @artist = Artist.find(params[:id])
    authorize @artist
  end

  private

  def get_and_authorize_artist
    @artist = current_artist
    authorize @artist
  end

end
