class SearchesController < ApplicationController

  def search
    @games = Game.search(params[:keyword])
  end
end