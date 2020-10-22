class Post < ApplicationRecord
	belongs_to :user, optional: true
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
end
