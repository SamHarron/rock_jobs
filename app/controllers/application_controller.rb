class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    private
    
    def current_user
        @current_user ||= Employee.find_by_id(session[:employee_id]) if session[:employee_id]
    end

    def logged_in?
        !!session[:employee_id]
    end

    def require_logged_in
        redirect_to '/login' if !logged_in?
    end

end
