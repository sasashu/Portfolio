class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  before_action :set_public_user

  def index
  end

  def show
    @reviews = @user.reviews
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to my_page_path, notice: "変更が保存されました。"
    else
      render :edit
    end
  end

  def withdraw
    # 会員ステータスをtrueからfalseに切り替える処理を行い、退会処理としている。
    @user.update(is_active: false)
    reset_session
    redirect_to root_path, notice: "正常に退会が行われました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :is_active)
  end

  def ensure_guest_user
    @user = current_user
    if @user.name == "guestuser"
      redirect_to my_page_path, alert: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

  def set_public_user
    @user = current_user
  end

end
