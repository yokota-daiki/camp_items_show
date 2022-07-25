class ChangeDataCategoryToItem < ActiveRecord::Migration[6.1]
  def up
    change_column :items, :category, :string
  end

  def down
    change_column :items, :category, :integer
  end
end
