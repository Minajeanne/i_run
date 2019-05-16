class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :stats, :completion?, :completion
  end
end
