class Employee < ApplicationRecord
    has_secure_password

    validates :username, presence: true, uniqueness: true

    validates :email, presence: true, uniqueness: true

    validates :contact_number, phone: { possible: true, allow_blank: false}, uniqueness: false
    before_save :format_phone

    def format_phone
        self.contact_number = Phonelib.parse(contact_number).national
    end
    
end
