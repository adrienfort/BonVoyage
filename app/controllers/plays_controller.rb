class PlaysController < ApplicationController
  before_action :authenticate_explorer!

  def pundit_user
    current_explorer
  end

  def create
    listen = Play.new(play_params)
    authorize listen

    if listen.save
      render json: { success: true }
    else
      render json: { success: false, errors: listen.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def play_params
    params.require(:play).permit(:music_id)
  end

end
