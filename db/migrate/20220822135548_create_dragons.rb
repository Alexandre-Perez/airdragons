class CreateDragons < ActiveRecord::Migration[7.0]
  def change
    create_table :dragons do |t|
      t.string :name
      t.text :description
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
