class Public::GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_game, only: [:edit, :update, :destroy]

  def index
    # 同条件の多分岐なのでif文よりcase文の方がシンプルに記述できる
    # 1行目でレビューのrateのあるレビューの平均を表示させ、
    # 点数が無いレビューは2行目で.all - 1行目 で点数ありを引いて表示、
    # 3行目で1行目に2行目をpushで追加し、flattenで配列の[ ] を平滑化させている。
    case params[:sort]
    when 'rate'
      sorted_game_ids = Review.group(:game_id).order('avg(rate) DESC').pluck(:game_id)
      no_review_game_ids = Game.ids - sorted_game_ids
      @games = Game.find(sorted_game_ids.push(no_review_game_ids).flatten)
    when 'date_DESC'
      @games = Game.all.order('created_at DESC')
    when 'date_ASC'
      @games = Game.all.order('created_at ASC')
    when 'sales_DESC'
      @games = Game.all.order('sales_date DESC')
    else
      @games = Game.all.order('created_at DESC')
    end
    # タグを指定するとそれに紐付けられたタグを絞り込みで表示
    # 順表示の下にタグ絞り込みを記述することで順序を変えた状態でタグ絞り込みを行なっている。
    if params[:tag_id].present?
      tag_game_ids = GameTag.where(tag_id: params[:tag_id]).pluck(:game_id)
      @games = Game.find(@games.pluck(:id) & tag_game_ids)
    end
    # page(params[:page])の後に.per(10)を追加する事で1ページあたりの表示を制限
    # findだと問題は無いが、where等の配列を持って来たいのでKaminariにarrayを追加で記述する。
    @games = Kaminari.paginate_array(@games).page(params[:page]).per(20)
    @total_games = Game.all

  end

  def show
    @game = Game.find(params[:id])
    @review = Review.new
    @reviews = @game.reviews
  end


  private

  def game_params
    params.require(:game).permit(:title,  tag_ids: [])
  end
end
