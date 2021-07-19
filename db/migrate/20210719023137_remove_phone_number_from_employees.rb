class RemovePhoneNumberFromEmployees < ActiveRecord::Migration[6.1]
  def change
    remove_column :employees, :phone_number, :string
  end
end
