class MeasurementsController < ApplicationController
  before_action :require_logged_in

  
  def index
    if params[:location_id] && @location = Location.find_by_id(params[:location_id])
      @measurements = @location.measurements
    else
      flash[:errors] = ["That Location Does Not Exist"] if params[:location_id]
      redirect_to locations_path
    end
  end

  def new
    if params[:location_id] && @location = Location.find_by_id(params[:location_id])
      @measurement = @location.measurements.build
    else
      flash[:errors] = ["That Location Does Not Exist"] if params[:location_id]
      @measurement = Measurement.new
    end
  end

  def create
    @measurement = current_user.measurements.build(measurement_params)
    if @measurement.save
      redirect_to employee_path(current_user)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def measurement_params
    params.require(:measurement).permit(:location_id, :length, :width, :date)
  end
end
