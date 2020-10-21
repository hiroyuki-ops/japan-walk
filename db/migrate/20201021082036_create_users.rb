class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.string :name
      t.string :name_kana
      t.string :email
      t.string :encrypted_password
      t.string :reset_password_token
      t.string :profile_image_id
      t.string :birthday
      t.string :introduction
      t.boolean :is_deleted, default: false, null: false
      t.timestamps
    end
  end
end
