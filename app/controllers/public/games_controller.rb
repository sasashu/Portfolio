class Public::GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update, :destroy]

  def index
    # タグidがあった場合にはタグidから検索できるようにして、タグに紐付くリストを取得
    # タグidが渡されなければ　Game.allで取得
    @games = params[:tag_id].present? ? Tag.find(params[:tag_id]).games : Game.all
    # page(params[:page])の後に.per(10)を追加する事で1ページあたりの表示を制限
    @games = @games.page(params[:page]).per(10)
    # 件数表示の為にアクションを作成
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
