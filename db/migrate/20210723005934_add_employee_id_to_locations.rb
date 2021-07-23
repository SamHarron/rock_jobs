class AddEmployeeIdToLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :employee_id, :integer
  end
end
