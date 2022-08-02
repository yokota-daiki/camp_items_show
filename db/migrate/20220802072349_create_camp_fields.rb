class CreateCampFields < ActiveRecord::Migration[6.1]
  def change
    create_table :camp_fields do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.string :adrress

      t.timestamps
    end
  end
end
