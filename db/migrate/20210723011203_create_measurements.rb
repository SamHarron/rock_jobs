class CreateMeasurements < ActiveRecord::Migration[6.1]
  def change
    create_table :measurements do |t|
      t.integer :employee_id
      t.integer :location_id
      t.string :length
      t.string :width
      t.date :date

      t.timestamps
    end
  end
end
