class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :name
      t.references :campaign
      t.integer :old_id
      t.timestamps
    end
  end
end
