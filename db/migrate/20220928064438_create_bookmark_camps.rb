class CreateBookmarkCamps < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmark_camps do |t|
      t.references :user, null: false, foreign_key: true
      t.references :camp_field, null: false, foreign_key: true

      t.timestamps
    end
    add_index :bookmark_camps, %i[user_id camp_field_id], unique: true
  end
end
