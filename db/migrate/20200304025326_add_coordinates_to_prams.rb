class AddCoordinatesToPrams < ActiveRecord::Migration[5.2]
  def change
    add_column :prams, :latitude, :float
    add_column :prams, :longitude, :float
  end
end
