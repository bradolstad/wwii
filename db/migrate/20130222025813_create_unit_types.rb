class CreateUnitTypes < ActiveRecord::Migration
  def change
    create_table :unit_types do |t|
      t.string :name
      t.references :icon

      t.timestamps
    end
    add_index :unit_types, :icon_id
  end
end
