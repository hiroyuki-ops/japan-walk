class SearchsController < ApplicationController
  def search
  	@posts = Post.search(params[:search])
  end

  def index
  end
end
