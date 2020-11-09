class Post < ApplicationRecord
	belongs_to :user
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
    has_many :users, through: :favorites, source: :user
	validates :shooting_date, presence: true
    belongs_to :category

  has_one :spot, dependent: :destroy
  accepts_nested_attributes_for :spot

  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :image

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

    def self.hoge(fuga)
      find_by(post_id: favorite.posts.id)
    end

    #scope :hoge -> category_name {
    	#syori
    #}


end
