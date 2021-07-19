class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @employee = (Employee.find_by(id: session[:employee_id]) || Employee.new)
    end

    def logged_in?
        current_user.id != nil
    end

    def require_logged_in
        return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
    end

end
