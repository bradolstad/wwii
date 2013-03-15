class AddMarkerPathToUnitClass < ActiveRecord::Migration
  def change
    add_column :unit_classes, :marker_path, :string
  end
end
