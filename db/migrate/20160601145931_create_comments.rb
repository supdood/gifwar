class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :image_url
      t.text :body
      t.integer :user_id, null: false
      t.integer :battle_id, null: false
      t.integer :comment_id

      t.timestamps null: false
    end
  end
end
