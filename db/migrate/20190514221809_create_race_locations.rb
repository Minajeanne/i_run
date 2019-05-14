class CreateRaceLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :race_locations do |t|
      t.integer :race_id
      t.integer :location_id

      t.timestamps
    end
  end
end
