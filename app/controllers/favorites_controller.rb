class FavoritesController < ApplicationController

    before_action :set_favorite

  def create
    user = current_user
    post = Post.find(params[:post_id])
  	favorite = Favorite.create(user_id: user.id, post_id: post.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
  	user = current_user
  	post = Post.find(params[:post_id])
    favorite = Favorite.find_by(user_id: user.id, post_id: post.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def set_favorite
    @post = Post.find(params[:post_id])
  end

end