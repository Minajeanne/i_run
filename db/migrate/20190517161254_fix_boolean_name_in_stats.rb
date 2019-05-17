class FixBooleanNameInStats < ActiveRecord::Migration[5.2]
  def change
    remove_column :stats, :boolean => false
    add_column :stats, :completion, :boolean, default: false
  end
end
