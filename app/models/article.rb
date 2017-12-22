class Article < ApplicationRecord
  mount_uploader :eyecatch, EyecatchUploader
  mount_uploader :movie, MovieUploader
  
  belongs_to :user
  belongs_to :category
  
  
  validates :user_id, presence: true
  validates :category_id, presence: true
  
  validates :keyword, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  
  validates :bibilography, presence: true
  #validates :content, presence: true
  
  validate :content_type

  def content_type
    
    #if content.blank? && slideshare_embed.blank? && movie.blank?
    
    if content.presence || slideshare_embed.presence || movie.presence
    else
    # errors.add(:content, :slideshare_embed, :movie ,"どれかは入力必須です")
    # errors.add(オブジェクトの属性, "エラーメッセージ") # 1つ1つ使わないとダメ
     #puts "Please input email!"
    errors.add(:content, "内容,スライドシェア,動画のいづれかは必須です")
    errors.add(:slideshare_embed, "内容,スライドシェア,動画のいづれかは必須です")
    errors.add(:movie, "内容,スライドシェア,動画のいづれかは必須です")
    end
  end

end
