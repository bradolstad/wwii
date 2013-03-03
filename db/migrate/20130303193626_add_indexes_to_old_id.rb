class AddIndexesToOldId < ActiveRecord::Migration
  def change
    add_index :units, :old_id
    add_index :countries, :old_id
    add_index :operations, :old_id
  end
end
