class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  
  def show
    @user = User.find(params[:id])
    @quizzes = current_user.quizzes.order(id: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザー登録をしました。'
      redirect_to @user
    else
      flash.now[:danger] = '会員登録に失敗しました。'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:id, :name, :email, :password, :password_confirmation)
  end
  
end
