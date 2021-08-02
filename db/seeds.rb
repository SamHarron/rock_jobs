# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   ie.create([{ username: 'Star Wars' }, { username: 'Lord of the Rings' }])
#   Employee.create(username: 'test', email: 'test@aol.com', password: testtest, password_confirmation: 'testtest')

Employee.create(username: 'sjh', email: 'sjh@aol.com', contact_number: '5407981654', password: "sjh", password_confirmation: 'sjh')
Employee.create(username: 'sam', email: 'sam@aol.com', contact_number: '5406130807', password: "sam", password_confirmation: 'sam')

Location.create(street_address: '1486 Wayward Ave', city: 'Richmond', state: 'NM', zip_code: "76854", employee_id: '1')
Location.create(street_address: '2389 Woods Street', city: 'Julian', state: 'CA', zip_code: "13235", employee_id: '1')
Location.create(street_address: '3048 River Dr.', city: 'Restin', state: 'MD', zip_code: "13568", employee_id: '1')
Location.create(street_address: '9449 Circle Way', city: 'Pines', state: 'NY', zip_code: "69844", employee_id: '1')

Location.create(street_address: '6327 Pelican Dr.', city: 'Emerald Isle', state: 'NC', zip_code: "01558", employee_id: '2')
Location.create(street_address: '4690 James Street', city: 'Waynesboro', state: 'TN', zip_code: "46889", employee_id: '2')
Location.create(street_address: '7107 Mountain Way', city: 'Lewisburg', state: 'WV', zip_code: "31537", employee_id: '2')
Location.create(street_address: '7583 Kraig Rd', city: 'Boones', state: 'VA', zip_code: "24079", employee_id: '2')


