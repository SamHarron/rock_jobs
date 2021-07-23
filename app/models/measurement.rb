class Measurement < ApplicationRecord
    belongs_to :employee
    belongs_to :location
    
end
