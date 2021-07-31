class AddInfoToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :uid, :string
    add_column :employees, :provider, :string
  end
end
