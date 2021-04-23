class AddGenreToQuizzes < ActiveRecord::Migration[5.2]
  def change
    add_reference :quizzes, :genre, foreign_key: true
  end
end
