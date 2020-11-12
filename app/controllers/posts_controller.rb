class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:new, :index, :edit, :search]
    before_action :ensure_correct_user, only: [:edit, :update]
  def index
    if params[:category_name]
      category = Category.find_by(category_name: params[:category_name])
      @posts = Post.where(category_id: category.id)
    else
      @posts = Post.all
    end
    @post = Post.find_by(id: params[:id])
  end

  def show
    if user_signed_in?
      @post = Post.find_by(id: params[:id])
      @user = @post.user
      @post_comment = PostComment.new
      @post_comments = @post.post_comments
      @category = Category.find(params[:id])
      @lat = @post.spot.latitude
      @lng = @post.spot.longitude
      gon.lat = @lat
      gon.lng = @lng
      pp @post.spot
    else
      flash[:success] = "ここから先はログインが必要です！"
      redirect_to new_user_session_path
    end
  end

  def new
      @post = Post.new
      @post.build_spot
      @post.post_images.build
  end

  def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      @user = current_user
    if @post.save
      flash[:success] = "投稿が保存されました！"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        flash[:success] = "投稿が更新されました！"
        redirect_to post_path
      else
        render 'edit'
      end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
    @category_list = Category.all
    @category = Category.find(params[:id])
    @posts = @category.posts.all
  end

  private
  def post_params
    params.require(:post).permit(:body, :rate, :shooting_date, :area, :category_id, spot_attributes: [:address], post_images_images: [])
  end

  def task_params
    params.require(:user).permit(:name, :description)
    #tag_list を追加
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    @user = @post.user
    unless @user == current_user
      redirect_to posts_path
    end
  end
end
