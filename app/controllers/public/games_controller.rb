class Public::GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update, :destroy]

  def index
# case文
    # page(params[:page])の後に.per(10)を追加する事で1ページあたりの表示を制限
    # 新着順のソート
    if params[:sort] == 'rate'
      sorted_game_ids = Review.group(:game_id).order('avg(rate) DESC').pluck(:game_id)
      no_review_game_ids = Game.ids - sorted_game_ids
      @games = Game.find(sorted_game_ids.push(no_review_game_ids).flatten)
    else
      @games = Game.all.order('created_at DESC')
    end
    # タグidがあった場合にはタグidから検索できるようにして、タグに紐付くリストを取得
    # タグidが渡されなければ　Game.allで取得
    if params[:tag_id].present?
      tag_game_ids = GameTag.where(tag_id: params[:tag_id]).pluck(:game_id)
      @games = Game.find(@games.pluck(:id) & tag_game_ids)
    end
    @games = Kaminari.paginate_array(@games).page(params[:page]).per(10)

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
