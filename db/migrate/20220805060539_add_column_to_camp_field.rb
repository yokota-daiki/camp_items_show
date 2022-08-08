class AddColumnToCampField < ActiveRecord::Migration[6.1]
  def change
    add_column :camp_fields, :image, :string
  end
end
