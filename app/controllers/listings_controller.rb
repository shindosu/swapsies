class ListingsController < ApplicationController
  def index
  end

  def new
    @listing = Listing.new
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to user_listings_path(current_user)
    else
      render :new
    end
  end

  private

  def listing_params
    params.require('listing').permit(:game_id, :condition)
  end
end
