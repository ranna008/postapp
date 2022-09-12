class Post < ApplicationRecord 
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :favourites, dependent: :destroy
    validates :title, presence: true, 
    length: {minimum: 3, maximum: 100}
    validates :description, presence: true, 
    length: {minimum: 5, maximum: 5000}
end