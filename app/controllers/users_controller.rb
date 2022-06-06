class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def get_profile_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

  def edit
  end
end
