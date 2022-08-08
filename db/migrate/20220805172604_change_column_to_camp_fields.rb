class ChangeColumnToCampFields < ActiveRecord::Migration[6.1]
  def change
    rename_column :camp_fields, :lat, :latitude
    rename_column :camp_fields, :lng, :longitude
  end
end
