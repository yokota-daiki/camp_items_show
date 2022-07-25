class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name    , null: false
      t.references :user, null: false, foreign_key: true
      t.string :url
      t.string :maker  

      t.timestamps
    end
  end
end
