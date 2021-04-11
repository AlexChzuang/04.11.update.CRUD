class AddCounterToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :vote_logs_count, :integer
  end
end
