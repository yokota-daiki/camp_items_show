class ChengeToCampFieldColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :camp_fields, :adrress, :address
  end
end
