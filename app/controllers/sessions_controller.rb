class SessionsController < ApplicationController


    def create 
        employee = Employee.find_by_username(params[:username])
        if employee && employee.authenticate(params[:password])
            session[:employee_id] = employee.id
            redirect_to employee_path(employee)
        else
            flash[:errors] = "Invalid Login. Please Try Again."
            redirect_to '/login'
        end
    end

    def logout
        session.clear
        redirect_to new_employee_path
    end

    def google
        employee = Employee.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |emp|
            emp.username = request.env['omniauth.auth'][:info][:name]
            emp.email = request.env['omniauth.auth'][:info][:email]
            emp.password = SecureRandom.hex(15)
        end
        if employee.valid?
            session[:employee_id] = employee.id
            redirect_to employee_locations_path(employee.id)
        else
            redirect_to login_path
        end
    end
end
