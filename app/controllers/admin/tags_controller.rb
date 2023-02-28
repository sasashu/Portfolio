class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_tag, only: [:edit, :update, :destroy]

  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path, notice: '登録が完了しました。'
    else
      @tags = Tag.all
      render :index
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to admin_tags_path, notice: '変更が保存されました。'
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to admin_tags_path, notice: "削除されました。"
  end

  private
  # before_actionにて重複しているコードを集約させている。
  def set_tag
    @tag = Tag.find(params[:id])
  end
  
  def tag_params
    params.require(:tag).permit(:name)
  end

end
