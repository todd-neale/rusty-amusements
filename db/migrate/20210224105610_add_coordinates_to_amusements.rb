class AddCoordinatesToAmusements < ActiveRecord::Migration[6.1]
  def change
    add_column :amusements, :latitude, :float
    add_column :amusements, :longitude, :float
  end
end
