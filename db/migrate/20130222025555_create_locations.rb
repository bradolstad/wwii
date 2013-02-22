class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :lattitude
      t.float :longitude
      t.string :name

      t.timestamps
    end
  end
end
