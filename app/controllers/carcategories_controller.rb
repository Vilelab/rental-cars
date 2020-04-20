class CarcategoriesController < ApplicationController

  def index
    @carcategories = Carcategory.all
  end

  def new
    @carcategory = Carcategory.new
  end

  def create
    @carcategory = Carcategory.new(carc_params)
    @carcategory.save
    redirect_to @carcategory
  end

  def show
    @carcategory = Carcategory.find(id)
  end

  def edit

  end

  private def carc_params 
    params.require(:carcategory).permit(:name, :daily_rate, :car_insurance, :third_party_insurance)
  end

  private  def id
    id = params[:id]
  end

end
