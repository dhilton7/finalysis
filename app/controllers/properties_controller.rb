class PropertiesController < ApplicationController
  before_action :set_property, only: %i[destroy edit show update]

  def new
    @property = Property.new
  end

  def create
    if Property.create property_params
      redirect_to properties_path
    else
      render :new
    end
  end

  def show
  end

  def index
    @properties = Property.all
  end

  def edit
  end

  def update
    if @property.update property_params
      redirect_to properties_path
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path
  end

  private

  def set_property
    @property = Property.find params[:id]
  end

  def property_params
    params.require(:property).permit %i[address city state zip status notes]
  end
end
