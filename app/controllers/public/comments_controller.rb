class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
    @review_id = params[:review_id]
    @review = Review.find(params[:review_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @review = Review.find(comment_params[:review_id])
    if @comment.save
      redirect_to game_path(@review.game), notice: "登録が完了しました。"
    else
      @review = Review.find(params[:review_id])
      render "new"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to game_path(@comment.review.game.id), notice: "削除されました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:review_id, :comment)
  end
end
