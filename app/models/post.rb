class Post < ApplicationRecord
	belongs_to :user
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
    has_many :users, through: :favorites, source: :user
	attachment :post_image, destroy: false
	validates :shooting_date, presence: true
    belongs_to :category

	def favorited_by?(user)
	  favorites.where(user_id: user.id).exists?
	end

	def self.search(search)
      if search
        Post.where(['content LIKE ?', "%#{search}%"])
      else
        Post.all
      end
    end

    scope :hoge -> category_name {
    	#syori
    }


end
