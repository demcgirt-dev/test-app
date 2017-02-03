class User < ActiveRecord::Base
  
  has_many :articles, dependent: :destroy
  has_secure_password # bcrypt method
  
  before_save { self.email = email.downcase } # before email saves to database, downcase it
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }, 
            length: { minimum: 3, maximum: 30 }
            
  # Regular Expressions can be tested here: [ rubular.com ]
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, length: { minimum: 10, maximum: 50 }, uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  
end