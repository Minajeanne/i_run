class AddLocationToRaces < ActiveRecord::Migration[5.2]
  def change
    add_column :races, :location, :string
  end
end
