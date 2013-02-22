class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.references :location
      t.datetime :date
      t.references :campaign
      t.integer :zoom_level
      t.references :event_type

      t.timestamps
    end
    add_index :events, :location_id
    add_index :events, :campaign_id
    add_index :events, :event_type_id
  end
end
