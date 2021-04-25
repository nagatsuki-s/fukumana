class FavoritesController < ApplicationController
  def create
    quiz = Quiz.find(params[:quiz_id])
    current_user.favorite(quiz)
    #flash[:success] = "いいねしました。"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    quiz = Quiz.find(params[:quiz_id])
    current_user.unfavorite(quiz)
    #flash[:danger] = "いいねを外しました。"
    redirect_back(fallback_location: root_path)
  end
end