class CreateEventAttributes < ActiveRecord::Migration
  def change
    create_table :event_attributes do |t|
      t.references :event
      t.references :unit
      t.references :country
      t.references :operation

      t.timestamps
    end
    add_index :event_attributes, :event_id
    add_index :event_attributes, :unit_id
    add_index :event_attributes, :country_id
    add_index :event_attributes, :operation_id
  end
end
