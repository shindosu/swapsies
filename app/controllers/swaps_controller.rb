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
    if @swap.save
      redirect_to swaps_path
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
      redirect_to swaps_path
    else
      render :edit
    end
  end

  private

  def swap_params
    params.require('swap').permit(:listing_offered, :listing_requested, :status)
  end
end
