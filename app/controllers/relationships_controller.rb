class RelationshipsController < ApplicationController
  def create
    following = current_user.follow(@user)
    following.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to @user
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to @user
    end
  end

  private
  def set_user
    @user = User.find(params[:relationship][:follow_id])
  end

end
