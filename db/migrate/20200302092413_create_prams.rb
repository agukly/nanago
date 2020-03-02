class CreatePrams < ActiveRecord::Migration[5.2]
  def change
    create_table :prams do |t|
      t.string :brand
      t.string :model
      t.text :location
      t.integer :year
      t.string :description
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
