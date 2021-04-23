class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.text :content
      t.string :answer
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
