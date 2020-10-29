class PostCommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@post_comment = @post.post_comments.new(post_comment_params)
  	@post_comment.user_id = current_user.id
    @post_comment.post_id = params[:post_id]
    if @post_comment.save
      flash[:success] = "successfully"
    else
      @post_comments = PostComment.where(id: @post_comment.post)
      render "/posts/show"
    end

  end

  def destroy
  	@post = Post.find(params[:post_id])
    @post_comment = current_user.post_comments.find_by(id: params[:id])
    @post_comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :post_id)
  end

end

