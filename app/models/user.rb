class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :articles
  
  
  has_many :ownerships,  :dependent => :destroy
  has_many :gathering, through: :ownerships, class_name: 'Article', source: :article
  
  has_many :likes
  has_many :like_articles, through: :likes, class_name: 'Article', source: :article
  
  has_many :wants
  has_many :want_articles, through: :wants, class_name: 'Article', source: :article
  
  
  def want(article)
    self.wants.find_or_create_by(article_id: article.id)
  end

  def unwant(article)
    want = self.wants.find_by(article_id: article.id)
    want.destroy if want
  end

  def want?(article)
    self.want_articles.include?(article)
  end
  
  def like(article)
    self.likes.find_or_create_by(article_id: article.id)
  end

  def unlike(article)
    like = self.likes.find_by(article_id: article.id)
    like.destroy if like
  end

  def like?(article)
    self.like_articles.include?(article)
  end
  
  
end
