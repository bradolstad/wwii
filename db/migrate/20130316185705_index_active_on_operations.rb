class IndexActiveOnOperations < ActiveRecord::Migration
  def change
    add_index :operations, :active

  end
end
