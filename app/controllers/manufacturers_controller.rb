class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
    
  end

  def new

  end
  
  def create
    @manufacturer = Manufacturer.new(params.require(:manufacturer).permit(:name))
    @manufacturer.save
   #redirect_to manufacturer_path(id: @manufacturer.id)
    redirect_to @manufacturer
  end

  def show
   id = params[:id]
   @manufacturer = Manufacturer.find(id)
  end
end
