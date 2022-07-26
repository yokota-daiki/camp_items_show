class AddIndexColumnToItems < ActiveRecord::Migration[6.1]
  def change
    add_index :items, [:name, :url], unique: true
  end
end
