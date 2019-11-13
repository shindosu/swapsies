class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @swaps = Swap.all
  end
end
