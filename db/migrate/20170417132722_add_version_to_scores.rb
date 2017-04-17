class AddVersionToScores < ActiveRecord::Migration[5.0]
  def change
    add_reference :scores, :version, foreign_key: true
  end
end
