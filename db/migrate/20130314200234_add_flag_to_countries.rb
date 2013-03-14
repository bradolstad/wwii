class AddFlagToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :flag_path, :string
  end
end
