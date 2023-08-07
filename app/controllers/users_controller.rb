class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  # def create
    # @user = User.new(user_params)
  #   @user = current_user
  #   if user.save
  #     flash[:notice] = "you have signed up Successfully"
  #     redirect_to image_path
  #   else
  #     render :new
  #   end
  # end

  def index
    @newbook = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @newbook = Book.new
    @books = @user.books
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to edit_user_path(@user.id)
    end
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to edit_user_path(@user.id)
    end
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "you have upadated UserInformation successfully"
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :user_id, :user)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to edit_user_path(@user.id)
    end
  end
end
