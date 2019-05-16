class AddAttributesToRaces < ActiveRecord::Migration[5.2]
  def change
    add_column :races, :event_date, :date
    add_column :races, :distance, :string
  end
end
