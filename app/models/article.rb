class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  
  validates :user_id, presence: true
  validates :category_id, presence: true
  
  validates :keyword, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  
  validates :content, presence: true
  validates :bibilography, presence: true
end
