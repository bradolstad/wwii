class RenameColumnEventsOldIdToUniqueId < ActiveRecord::Migration
  def up
    rename_column :events, :old_id, :unique_id
  end

  def down
  end
end
