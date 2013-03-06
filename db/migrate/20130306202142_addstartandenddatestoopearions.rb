class Addstartandenddatestoopearions < ActiveRecord::Migration
  def up
    add_column :operations, :start_date, :datetime
    add_column :operations, :end_date, :datetime
  end

  def down
    remove_column :operations, :start_date
    remove_column :operations, :end_date
  end
end
