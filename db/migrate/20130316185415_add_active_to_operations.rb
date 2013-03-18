class AddActiveToOperations < ActiveRecord::Migration
  def change
    add_column :operations, :active,:boolean, default: true
  end

end
