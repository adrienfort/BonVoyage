class ExplorersController < ApplicationController

  def show
    @explorer = Explorer.find(params[:id])
  end

end
