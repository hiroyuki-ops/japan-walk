class Post < ApplicationRecord
	belongs_to :user
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
    has_many :users, through: :favorites, source: :user
	attachment :post_image, destroy: false
	validates :shooting_date, presence: true

	def favorited_by?(user)
	  favorites.where(user_id: user.id).exists?
	end

end
