class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        if session[:employee_id]
            Employee.find(session[:employee_id])
        end
    end

    def logged_in?
        !!current_user
    end


end
