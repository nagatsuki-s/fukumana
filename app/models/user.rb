class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 100 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :quizzes, dependent: :destroy
    
    has_many :favorites, dependent: :destroy
    has_many :likes, through: :favorites, source: :quiz
    
    def favorite(quiz)
        self.favorites.find_or_create_by(quiz_id: quiz.id)
    end
    
    def unfavorite(quiz)
        like = self.favorites.find_by(quiz_id: quiz.id)
        like.destroy if like
    end
    
    def favorite?(quiz)
        self.likes.include?(quiz)
    end

end
