class ChangeStatsCompletionColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :stats, :completion, :boolean => false
  end
end
