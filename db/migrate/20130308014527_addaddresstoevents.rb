class Addaddresstoevents < ActiveRecord::Migration
  def up
    add_column :events, :address, :string
  end

  def down
  end
end
