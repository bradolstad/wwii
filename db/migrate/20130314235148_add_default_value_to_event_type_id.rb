class AddDefaultValueToEventTypeId < ActiveRecord::Migration
  def change
    change_column :events, :event_type_id, :integer, :default=>0
  end
end
