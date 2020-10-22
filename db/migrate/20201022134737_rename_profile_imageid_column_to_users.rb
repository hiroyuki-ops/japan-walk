class RenameProfileImageidColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :profile_imageid, :profile_image_id
  end
end
