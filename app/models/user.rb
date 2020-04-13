class User < ApplicationRecord
    
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 30 }
  validates :college, presence: true, length: { maximum: 30 }
  validates :group, presence: true, length: { maximum: 30 }
  validates :career, presence: true, length: { maximum: 30 }
  validates :course, presence: true, length: { maximum: 30 }
  validates :interest_industry, presence: true, length: { maximum: 30 }
  
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
  has_secure_password
  
end
