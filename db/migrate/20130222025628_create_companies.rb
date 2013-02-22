class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.references :unit_type
      t.string :size
      t.references :icon
      t.string :country

      t.timestamps
    end
    add_index :companies, :unit_type_id
    add_index :companies, :icon_id
  end
end
