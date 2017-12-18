class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  validates :belonging, :numericality => { :allow_blank => true }
  validates :major, :numericality => { :allow_blank => true }
  validates :publication, :numericality => { :allow_blank => true }
  
  
  
end
