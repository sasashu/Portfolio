class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to game_path(@comment.review), notice: "削除されました。"
  end

end
