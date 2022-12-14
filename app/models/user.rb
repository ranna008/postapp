class User < ApplicationRecord 
    before_save { self.email = email.downcase }
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :favourites, dependent: :destroy
    validates :username, presence: true, 
    length: {minimum: 3, maximum: 30},uniqueness: { case_sensitive: false }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, 
    length: {maximum: 50},uniqueness: { case_sensitive: false },
    format: { with: VALID_EMAIL_REGEX } 
    has_secure_password
end