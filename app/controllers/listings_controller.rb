class ListingsController < ApplicationController
  def new
    @listing = Listing.new
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    raise
    if @listing.save
      redirect_to user_path(@listing.user)
    else
      render :new
    end
  end

  private

  def listing_params
    params.require('listing').permit(:game_id, :condition)
  end
end
