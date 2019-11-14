class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:search] && !params[:search][:query].empty?
      @games = Game.search_by_title_description_console_and_rating(params[:search][:query])
    else
      @games = Game.all.limit(50)
    end
  end

  def show
    @game = Game.find(params[:id])
  end
end
