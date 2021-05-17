class FanMusicsController < ApplicationController
  before_action :authenticate_explorer!
  before_action :get_explorer_and_music, only: [:create, :destroy]

  def pundit_user
    current_explorer
  end

  def create
    @fan_music = FanMusic.new(explorer: @explorer, music: @music)
    authorize @fan_music

    @fan_music.save!
    # remplacer le fallback location actuel par la playlist "Bon Voyage" !!!
    redirect_back(fallback_location: dashboard_explorer_path(@explorer))
  end

  def destroy
    @fan_music = FanMusic.find(params[:id])
    authorize @fan_music

    @fan_music.destroy
    # remplacer le fallback location actuel par la playlist "Bon Voyage" !!!
    redirect_back(fallback_location: dashboard_explorer_path(@explorer))
  end

  private

  def get_explorer_and_music
    @explorer = current_explorer
    @music = Music.find(params[:music_id])
  end

end
