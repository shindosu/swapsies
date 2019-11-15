class WishlistItemsController < ApplicationController
  def index
  end

  def new
    @wishlist_item = WishlistItem.new
  end

  def show
    @wishlist_item = WishlistItem.find(params[:id])
  end

  def create
    @wishlist_item = WishlistItem.new(wishlist_item_params)
    @wishlist_item.user = current_user
    if @wishlist_item.save
      redirect_to user_wishlist_items_path(current_user)
    else
      render :new
    end
  end

  private

  def wishlist_item_params
    params.require('wishlist_item').permit(:game_id, :condition)
  end
end
