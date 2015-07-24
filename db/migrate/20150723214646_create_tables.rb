class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :description
      t.string :title
      t.timestamps null: false
    end
  end
end
