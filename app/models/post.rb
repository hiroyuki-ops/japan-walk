class Post < ApplicationRecord
	belongs_to :user
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
	attachment :post_image, destroy: false
	validates :shooting_date, presence: true
end
