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
  
  has_many :ownerships, :dependent => :destroy
  has_many :users, through: :ownerships
  
  has_many :wants
  has_many :want_users, through: :wants, class_name: 'User', source: :user
  
   has_many :likes
  has_many :like_users, through: :likes, class_name: 'User', source: :user 

  def content_type
    
    #if content.blank? && slideshare_embed.blank? && movie.blank?
    
    if content.presence || slideshare_embed.presence || movie.presence
    else
    # errors.add(:content, :slideshare_embed, :movie ,"どれかは入力必須です")
    # errors.add(オブジェクトの属性, "エラーメッセージ") # 1つ1つ使わないとダメ
     #puts "Please input email!"
    errors.add(:content, ", スライドシェア, 動画のいづれかは必須です")
    errors.add(:slideshare_embed, ", 本文, 動画のいづれかは必須です")
    errors.add(:movie, ", 本文, スライドシェア,のいづれかは必須です")
    end
  end
  
  def self.search(search) #ここでのself.はUser.を意味する
    if search
      where(['keyword LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      all #全て表示。User.は省略
    end
  end

end
