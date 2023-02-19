class Admin::GamesController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(@game.id), notice: "登録が完了しました。"
    else
      render :new
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game.id), notice: "変更が保存されました。"
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path, notice: "削除されました。"
  end

  def new
    @game = Game.new

    #ここで空の配列を作ります
    @books = []
    @title = params[:title]
    if @title.present?
  #この部分でresultsに楽天APIから取得したデータ（jsonデータ）を格納します。
  #今回は書籍のタイトルを検索して、一致するデータを格納するように設定しています。
    results = RakutenWebService::Books::Game.search({
    title: @title,
    })
  #この部分で「@books」にAPIからの取得したJSONデータを格納していきます。
  #read(result)については、privateメソッドとして、設定しております。
      results.each do |result|
    #下位置
       book = Game.new(read(result))
       @books << book  #<<何？ハッシュを取り出す
      end
    end
  end


  private
#「楽天APIのデータから必要なデータを絞り込む」、且つ「対応するカラムにデータを格納する」メソッドを設定していきます。
  def read(result)
    {
    title: result["title"],
    label: result["label"],
    sales_date: result["salesDate"],
    item_url: result["item_url"],
    jan: result["jan"],
    image_url: result["mediumImageUrl"].gsub('?_ex=120x120', ''),
    item_caption: result["item_caption"]
    }
  end

  def game_params
    params.require(:game).permit(:title, :item_caption, :sales_date, :label, :jan, :item_url, :image_url, tag_ids: [])
  end

end
