class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  

  private


  def set_search
    @query = { title_cont: params[:q] }
    @search = Game.ransack(@query)
    @search_games = @search.result.order(created_at: :desc).page(params[:page]).per(10)
  end


    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
    end
end
