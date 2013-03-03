class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.references :unit_type
      t.integer :old_id
      t.references :country
      t.timestamps
    end
    add_index :units, :unit_type_id
    add_index :units, :country_id
  end
end
