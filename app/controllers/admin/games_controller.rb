class Admin::GamesController < ApplicationController
  # def index
  # end

  # def new
  # end

  def show
    results = RakutenWebService::Books::Game.search({
    jan: params[:game][:title],
    })

    if Game.exists?(title: params[:game][:title])
      @game = Game.find_by(title: params[:game][:title])
    else
  #この部分で「@books」にAPIからの取得したJSONデータを格納していきます。
  #read(result)については、privateメソッドとして、設定しております。
    #下位置
      @game = Game.new(game_params)

      @game.introduction = "仮の説明です"
      @game.release = Date.today
      @game.save
    end
      @games = []
      results.each do |result|
    #下位置
       game = Game.new(read(result))
       @games << game  #<<何？ハッシュを取り出す
      end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(game_params)
    @game.introduction = "仮の説明です"
    @game.release = Date.today
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
    redirect_to games_path, alert: "削除されました。"
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

  # def create
  # result = RakutenWebService::Books::Book.search({
  # isbn: params[:isbn],
  # })
  # Book.find_or_create_by!(read(result.response.as_json[0]["params"]))
  # redirect_to request.referer
  #    render :request.referer
  # end

  private
#「楽天APIのデータから必要なデータを絞り込む」、且つ「対応するカラムにデータを格納する」メソッドを設定していきます。
  def read(result)
    title = result["title"]
    introduction = result["jan"]
    # author = result["author"]
    # url = result["itemUrl"]
    # isbn = result["isbn"]
    # image_url = result["mediumImageUrl"].gsub('?_ex=120x120', '')
    # book_genre_id = result["booksGenreId"]
    # item_caption = result["itemCaption"]
    {
    title: title,
    introduction: introduction,
    # author: author,
    # url: url,
    # isbn: isbn,
    # image_url: image_url,
    # book_genre_id: book_genre_id,
    # item_caption: item_caption
    }
  end

  # def book_params
  # params.require(:book).permit(:title)
  # end

  def game_params
    params.require(:game).permit(:title, :introduction, :release, tag_ids: [])
  end

end
