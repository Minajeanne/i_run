class AddFinishTimeToStats < ActiveRecord::Migration[5.2]
  def change
    add_column :stats, :finish_time, :string
  end
end
