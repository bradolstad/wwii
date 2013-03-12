class ChangeEvents < ActiveRecord::Migration
  def up
    add_column :events, :unit_id, :integer
    add_column :events, :country_id, :integer
    add_column :events, :operation_id, :integer
  end

  def down
  end
end
