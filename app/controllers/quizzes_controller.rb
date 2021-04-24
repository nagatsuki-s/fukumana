class QuizzesController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :update, :edit, :destroy]
  before_action :correct_user, only: [:update, :edit, :destroy]
  before_action :set_quiz, only: [:update, :edit, :destroy]
  
  def index
    @quizlist = Quiz.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = current_user.quizzes.build
    @quiz.build_genre
  end

  def create
    @quiz = current_user.quizzes.build(quiz_params)
    if @quiz.save
      flash[:success] = 'クイズを投稿しました。'
      redirect_to user_path(current_user)
    else
      set_quizzes
      flash.now[:danger] = 'クイズを投稿できませんでした。'
      redirect_back(fallback_location: user_path(current_user))
    end
  end

  def update
    if @quiz.update(quiz_params)
      flash[:success] = 'クイズを更新しました。'
      redirect_to user_path(current_user)
    else
      set_quizzes
      flash.now[:danger] = 'クイズを更新できませんでした。'
      render :edit
    end

  end

  def edit
  end

  def destroy
    @quiz.destroy
    flash[:success] = 'クイズを削除しました。'
    redirect_back(fallback_location: user_path)
  end
  
  private
  
  def quiz_params
    params.require(:quiz).permit(:content, :answer, :create_at, genre_attributes: [:id, :category, :_destroy])
  end
  
  def set_quiz
    @quiz = current_user.quizzes.find(params[:id])
  end
  
  def set_quizzes
    @quizzes = current_user.quizzes.order(id: :desc)
  end
  
  def correct_user
    @user = current_user.quizzes.find_by(id: params[:id])
    unless @user
      redirect_back(fallback_location: quizzes_path)
    end
  end

end