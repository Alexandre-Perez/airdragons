class RemoveUserFromDragons < ActiveRecord::Migration[7.0]
  def change
    remove_reference :dragons, :user, null: false, foreign_key: true
  end
end
