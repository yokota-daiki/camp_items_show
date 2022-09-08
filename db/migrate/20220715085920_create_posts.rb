class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :camp_field, null: false
      t.string :comment
      t.boolean :public, default: false, null: false
      t.date :camped_date,               null: false

      t.timestamps
    end
  end
end
