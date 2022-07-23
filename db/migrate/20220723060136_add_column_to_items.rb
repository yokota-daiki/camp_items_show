class AddColumnToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :image_url, :string
    add_column :items, :category, :integer
  end
end
