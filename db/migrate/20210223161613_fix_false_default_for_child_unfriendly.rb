class FixFalseDefaultForChildUnfriendly < ActiveRecord::Migration[6.1]
  def change
    change_column_default :amusements, :childunfriendly, from: false, to: true
  end
end
