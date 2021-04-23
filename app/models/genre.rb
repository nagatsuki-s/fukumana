class Genre < ApplicationRecord
    has_many :quizzes
    
    #enum category: { 子ども・子育て支援:0, 介護:1, 障害:2, 高齢:3, マイノリティ:4, 地域・居場所:5, ボランティア:6, 多文化:7, 人権:8 }
end
