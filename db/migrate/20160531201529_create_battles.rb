class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.string :topic
      t.text :description
      t.integer :created_by_id

      t.timestamps null: false
    end
  end
end
