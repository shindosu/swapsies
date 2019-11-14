class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
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
