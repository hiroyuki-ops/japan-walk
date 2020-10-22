class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :search]
  def index
    @posts = Post.all
  end

  def show
    if user_signed_in?
      @post = Post.find(params[:id])
    else
      flash[:success] = "ここから先はログインが必要です！"
      redirect_to new_user_session_path
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
