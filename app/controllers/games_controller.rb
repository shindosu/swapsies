class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :home]

  def home
  end

  def index
    if params[:query].present?
      @games = Game.order("LOWER(title)").search_by_title_description_console_and_rating(params[:query])
    else
      @games = Game.all.limit(50).order("LOWER(title)")
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def listing_params
    params.require('listing').permit(:game_id, :condition)
  end
end
