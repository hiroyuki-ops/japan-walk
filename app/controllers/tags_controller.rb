class TagsController < ApplicationController
  def create
  end

  def destroy
  end

  private

  def task_params
    params.require(:user).permit(:name, :description, :tag_list) 
    #tag_list を追加
  end
end
