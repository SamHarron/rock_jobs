class AddZipCodeToLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :zip_code, :integer
  end
end
