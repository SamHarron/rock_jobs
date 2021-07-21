class Location < ApplicationRecord
    belongs_to :employee

    validates :street_address, presence: true, uniqueness: true 
    validates :city, presence: true
    validates :state, presence: true
    validates :zip_code, presence: true


end
