class Public::GamesController < ApplicationController
  def index
    # .page(params[:page])の後に.per(10)を追加する事で1ページあたりの表示を制限
    @games = Game.page(params[:page]).per(10)
    # 全件表示の為にアクションを作成
    @total_games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @review = Review.new
    # @game = Game.find(params[:game_id])
    @reviews = @game.reviews
  end

  def pc
  end

  def ps
  end

  def switch
  end

  def portable
  end

  def smartphone
  end
  
  private
  
  def game_params
    params.require(:game).permit(:title, :introduction, :release, tag_ids: [])
  end
end
