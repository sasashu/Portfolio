class Public::UsersController < ApplicationController
  def index
    @user = current_user
  end
  
  def show
    @user = current_user
    # @games = 
  end

  def edit
    @user = current_user
  end

  def confirm
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to my_page_path, notice: "変更が保存されました。"
    else
      render :edit
    end
  end

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path, notice: "正常に退会が行われました。"
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :is_active)
  end
  
end
