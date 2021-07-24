# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   ie.create([{ username: 'Star Wars' }, { username: 'Lord of the Rings' }])
#   Employee.create(username: 'test', email: 'test@aol.com', password: testtest, password_confirmation: 'testtest')

Employee.create(username: 'sjh', email: 'sjh@aol.com', contact_number: '15404275458', password: "sjh", password_confirmation: 'sjh')

Location.create(street_address: '554 Yellow Circle Dr.', city: 'Vinton', state: 'VA', zip_code: "12345", employee_id: '1')

Measurement.create(employee_id: '1', location_id: '1', length: '65', width: "24", date: '01/01/2021')
