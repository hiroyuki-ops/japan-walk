class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
      if @user.update(user_params)
        redirect_to user_path
      else
        render 'edit'
      end
  end

  def destroy
  end

  def follows
  end

  def followers
  end

  private
  def user_params
      params.require(:user).permit(:name, :email, :profile_image, :birthday, :introduction)
  end
end
