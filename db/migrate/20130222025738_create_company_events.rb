class CreateCompanyEvents < ActiveRecord::Migration
  def change
    create_table :company_events do |t|
      t.references :company
      t.references :event

      t.timestamps
    end
    add_index :company_events, :company_id
    add_index :company_events, :event_id
  end
end
