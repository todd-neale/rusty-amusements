class AddAddressToAmusements < ActiveRecord::Migration[6.1]
  def change
    add_column :amusements, :address, :string
  end
end
