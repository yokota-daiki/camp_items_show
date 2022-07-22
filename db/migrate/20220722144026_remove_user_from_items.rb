class RemoveUserFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_reference :items, :user, null: false, foreign_key: true
  end
end
