class Favorite < ApplicationRecord
	belongs_to :user
    belongs_to :post

    validates_uniqueness_of :post_id, scope: :user_id
    #validates_uniqueness_ofによって、一人が一つの投稿に対して、一つしかいいねを付けられないようにした。
end
