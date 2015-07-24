class AddUserIdToTables < ActiveRecord::Migration
  def change
    add_column :tables, :user_id, :integer
    add_index :tables, :user_id
  end
end
