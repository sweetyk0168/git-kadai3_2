class UsersController < ApplicationController
  def index
    @user = user.index(user_params)
  end

  def show
    #@user = User.find(params[:id])
    #@user_images = @user.user_images
  end
end
