class MeasurementsController < ApplicationController
  before_action :require_logged_in

  
  def index
    if params[:location_id] && @location = Location.find_by_id(params[:location_id])
      @measurements = @location.measurements
    else
     flash[:errors] = ["That Location Does Not Exist"]
     @measurements = Measurement.all
    end
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end
end
