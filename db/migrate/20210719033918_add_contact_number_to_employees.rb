class AddContactNumberToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :contact_number, :string
  end
end
