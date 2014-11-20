class AddCounterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_karma_points, :integer
    add_index :users, :total_karma_points
  end
end
