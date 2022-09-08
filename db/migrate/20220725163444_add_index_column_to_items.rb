class AddIndexColumnToItems < ActiveRecord::Migration[6.1]
  def change
    add_index :items, %i[name url], unique: true
  end
end
