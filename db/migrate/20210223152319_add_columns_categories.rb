class AddColumnsCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :amusements, :tagline, :string
    add_column :amusements, :deathcount, :integer, default: 0
    add_column :amusements, :size, :string
    add_column :amusements, :category, :string
    add_column :amusements, :haskilledanimals, :boolean, default: false
    add_column :amusements, :washingmachine, :boolean, default: false
    add_column :amusements, :childunfriendly, :boolean, default: false
    add_column :amusements, :heightrestriction, :boolean, default: false
    add_column :amusements, :haunting, :boolean, default: false
    add_column :amusements, :illegal, :boolean, default: false
  end
end
