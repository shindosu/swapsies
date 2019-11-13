class SwapsController < ApplicationController
  def index
    @swaps = Swap.all
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @swap = Swap.new
  end

  def create
    @swap = Swap.new(swap_params)
    @listing = Listing.find(params[:listing_id])
    @swap.listing_requested = @listing
    if @swap.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @swap = Listing.find(params[:id])
  end

  def update
    @swap = Listing.find(params[:id])
    if @swap.update(swap_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def swap_params
    params.require('swap').permit(:listing_offered_id)
  end
end
