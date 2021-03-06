class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
    
  end

  def show
   id = params[:id]
   @manufacturer = Manufacturer.find(id)
  end

  def new
    @manufacturer = Manufacturer.new
  end
  
  def create
    @manufacturer = Manufacturer.new(params.require(:manufacturer).permit(:name))
	
    if @manufacturer.save
      flash[:notice] = "Fabricante criado com sucesso"
      redirect_to @manufacturer
    else
      render :new 
    end
  end

  def edit
    id = params[:id]
    @manufacturer = Manufacturer.find(id)
  end

  def update
    id = params[:id]
    @manufacturer = Manufacturer.find(id)
    if @manufacturer.update(params.require(:manufacturer).permit(:name))
      flash[:notice] = "Fabricante editado com sucesso"
      redirect_to manufacturer_path
    else
      render :edit
    end
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy
    redirect_to manufacturers_path
  end

end
