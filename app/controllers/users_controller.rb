class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
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
    @user = User.find(params[:id]) #特定のidを持つ情報を取得
    @user.destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to :root_path #削除に成功すればrootページに戻る
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
    render 'followers'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'follows'
  end

  private
  def user_params
      params.require(:user).permit(:name, :email, :profile_image, :birthday, :introduction)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
