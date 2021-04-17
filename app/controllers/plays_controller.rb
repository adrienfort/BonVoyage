class PlaysController < ApplicationController

  def create
    listen = Play.new(play_params)

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
