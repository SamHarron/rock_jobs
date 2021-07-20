class Location < ApplicationRecord
    has_many :employees

    validates :street_address, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zip_code, presence: true


end
