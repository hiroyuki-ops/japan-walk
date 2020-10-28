class FavoritesController < ApplicationController

    before_action :set_favorite

  def create
    user = current_user
    post = Post.find(params[:post_id])
  	favorite = Favorite.create(user_id: user.id, post_id: post.id)
    render 'create'
  end

  def destroy
  	user = current_user
  	post = Post.find(params[:post_id])
    favorite = Favorite.find_by(user_id: user.id, post_id: post.id)
    favorite.destroy
    render 'destroy'
  end

  private
  def set_favorite
    @post = Post.find(params[:post_id])
    @id_name = "#favorite-link-#{@post.id}"
  end

end