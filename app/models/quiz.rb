class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  accepts_nested_attributes_for :genre
  
  validates :answer, presence: true, length: { maximum: 255 }
  
  def genre_category
    case self.genre.category
    when 0 
       "子ども"
    when 1
       "介護"
    when 2
      "障害"
    when 3
      "高齢"
    when 4
      "マイノリティ"
    when 5
      "地域"
    when 6
      "ボランティア"
    when 7
      "多文化"
    when 8
      "人権"
    when 9
      "その他"
    else
      ""
    end
  end
end
