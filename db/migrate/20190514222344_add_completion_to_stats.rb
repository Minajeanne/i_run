class AddCompletionToStats < ActiveRecord::Migration[5.2]
  def change
    add_column :stats, :completion?, :boolean
  end
end
