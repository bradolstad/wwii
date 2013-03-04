class AddDatesTable < ActiveRecord::Migration
  def change
    create_table :event_dates do |t|
      t.string :name
      t.integer :old_id
      t.timestamps
    end
  end
end
