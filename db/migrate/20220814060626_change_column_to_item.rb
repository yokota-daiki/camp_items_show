class ChangeColumnToItem < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :category, :string
  end
end
