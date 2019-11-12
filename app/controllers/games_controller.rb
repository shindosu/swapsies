class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @games = Game.all.limit(50)
  end

  def show
    @game = Game.find(params[:id])
  end
end
