class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, :edit, :search]
  def index
    @posts = Post.all
  end

  def show
    if user_signed_in?
      @post = Post.find(params[:id])
      @user = @post.user
    else
      flash[:success] = "ここから先はログインが必要です！"
      redirect_to new_user_session_path
    end
  end

  def new
      @post = Post.new
  end

  def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      @user = current_user
    if @post.save
      flash[:success] = "写真が保存されました！"
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
        flash[:success] = "写真が更新されました！"
        redirect_to post_path
      else
        render 'edit'
      end
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:post_image, :body, :rate, :shooting_date, :country_name, :area, spot_attributes: [:address])
  end
end
