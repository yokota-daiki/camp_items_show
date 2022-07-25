class CreateMyitems < ActiveRecord::Migration[6.1]
  def change
    create_table :myitems do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
    add_index :myitems, [:user_id, :item_id], unique: true
  end
end
