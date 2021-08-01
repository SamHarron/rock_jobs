module LocationsHelper

    def employees_locations
        if @employee
            "#{@employee.username}'s Locations"
        else
            'Please Sign In or Sign Up'
        end
    end


end
