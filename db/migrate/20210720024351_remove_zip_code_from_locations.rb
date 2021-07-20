class RemoveZipCodeFromLocations < ActiveRecord::Migration[6.1]
  def change
    remove_column :locations, :zip_code, :string
  end
end
