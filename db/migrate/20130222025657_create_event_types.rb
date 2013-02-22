class CreateEventTypes < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
      t.string :name
      t.references :icon

      t.timestamps
    end
    add_index :event_types, :icon_id
  end
end
