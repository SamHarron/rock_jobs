class Measurement < ApplicationRecord
    belongs_to :employee
    belongs_to :location
    
    validates :location, presence: true
    validates :length, presence: true
    validates :width, presence: true
    validates :date, presence: true

    scope :latest_date, -> {order(date: :desc)}

end
