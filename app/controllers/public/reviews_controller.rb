class Public::ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to game_path(@review.game), notice: "レビューが投稿されました。"
    else
      @game = Game.find(params[:game_id])
      @reviews = @game.reviews
      render "public/games/show"
      # redirect_to request.referrer
    end
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:game_id, :review_title, :review_comment, :rate)
  end
end
