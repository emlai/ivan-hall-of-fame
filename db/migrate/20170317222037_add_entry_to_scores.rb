class AddEntryToScores < ActiveRecord::Migration[5.0]
  def change
    add_column :scores, :entry, :string
  end
end
