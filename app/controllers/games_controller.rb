class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def home
  end

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


  # def new
  #   @listing = Listing.all
  #   @swap = Swap.all
  # end

  # def create
  #   @swap = Swap.new(swap_params)
  #   @listing = Listing.find(params[:listing_id])
  #   @swap.listing_requested = @listing
  #   if @swap.save
  #     redirect_to user_path(current_user)
  #   else
  #     render :new
  #   end
  # end

  private 
  
  def listing_params
    params.require('listing').permit(:game_id, :condition)
  end
end
