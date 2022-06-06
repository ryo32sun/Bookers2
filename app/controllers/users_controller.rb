class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def get_profile_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfuly"
      redirect_to user_path(@user.id)
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
