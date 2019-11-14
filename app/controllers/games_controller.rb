class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def home
  end

  def index
    if params[:query].present?
      @games = Game.where("title ILIKE ?", "%#{params[:query]}")
    else
      @games = Game.all.limit(50)
    end
  end

  def show
    @game = Game.find(params[:id])
  end
end
