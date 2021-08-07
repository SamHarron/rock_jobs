class Employee < ApplicationRecord
    has_many :locations
    has_many :measurements
    has_many :measured_locations, through: :measurements, source: :location
    
    has_secure_password

    validates :username, presence: true, uniqueness: true

    validates :email, presence: true, uniqueness: true

    validates :contact_number, phone: { possible: true, allow_blank: true}, uniqueness: false
    before_save :format_phone

    def format_phone
        self.contact_number = Phonelib.parse(contact_number).national
    end
    
    scope :employee_most_locations, -> {joins(:locations).group:employee_id).order('count(locations.id) desc').limit(1)} 
end
