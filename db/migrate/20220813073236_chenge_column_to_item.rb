class ChengeColumnToItem < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :category, :integer, using: 'category::integer'
  end
end
