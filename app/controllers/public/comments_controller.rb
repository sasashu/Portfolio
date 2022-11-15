class Public::CommentsController < ApplicationController
  def new
    @comment = Comment.new
    # @comment = current_user.comments.new(comment_params)
    # @game = Game.find(params[:id])
    @user = current_user
    @review = @user.reviews
    session[:previous_url] = request.referer
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to session[:previous_url], notice: "登録が完了しました。"
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  end

  private
  
  def comment_params
    params.require(:comment).permit(:review_id, :comment)
  end
end
