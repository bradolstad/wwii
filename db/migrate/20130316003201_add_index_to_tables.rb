class AddIndexToTables < ActiveRecord::Migration
  def change
     add_index :events, :operation_id
    add_index :events, :unit_id
    add_index :events, :country_id
  end
end
