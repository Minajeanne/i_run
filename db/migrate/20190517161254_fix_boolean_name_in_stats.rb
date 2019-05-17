class FixBooleanNameInStats < ActiveRecord::Migration[5.2]
  def change
    rename_column :stats, :completion, :boolean, default: false
  end
end
