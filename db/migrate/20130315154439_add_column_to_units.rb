class AddColumnToUnits < ActiveRecord::Migration
  def change
    add_column :units, :unit_class_id, :integer
  end
end
