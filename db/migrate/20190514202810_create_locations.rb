class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.integer :race_id
      
      t.timestamps
    end
  end
end
