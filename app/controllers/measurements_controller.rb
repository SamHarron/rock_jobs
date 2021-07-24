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
    if params[:location_id] && @location = Location.find_by_id(params[:location_id])
      @measurement = @location.measurements.build
    else
      @error = "That Location Does Not Exist" if params[:location_id]
      @measurement = Measurement.new
    end
  end

  def create
    @measurement = current_user.measurements.build(measurement_params)
    if @measurement.save
      redirect_to measurements_path
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
    params.require(:measurement).permit(:length, :width, :date, location_id, employee_id)
  end
end
