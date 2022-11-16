class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to game_path(@review.game), notice: "削除されました。"
  end

end
