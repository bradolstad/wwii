class CreateUnitClasses < ActiveRecord::Migration
  def change
    create_table :unit_classes do |t|
      t.string :name

      t.timestamps
    end
  end
end
