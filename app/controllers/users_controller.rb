class UsersController < ApplicationController
  def show
    @user = User.find(paramsS[:id])
  end
end
