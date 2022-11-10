class Public::GamesController < ApplicationController
  def index
    @games = Game.page(params[:page]).per(8)
  end

  def show
    @game = Game.find(params[:id])
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
