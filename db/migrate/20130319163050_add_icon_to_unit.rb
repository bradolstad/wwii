class AddIconToUnit < ActiveRecord::Migration
  def change
    add_column :units, :icon_id, :integer
  end
end
