class CarCategoriesController < ApplicationController

  def index
    @car_categories = CarCategory.all
  end

  def new
    @car_category = CarCategory.new
  end

  def create
    @car_category = CarCategory.new(carc_params)
    @car_category.save
    redirect_to @car_category
  end

  def show
    @car_category = CarCategory.find(id)
    # @car_models = CarModel.where(carcategory_id: @carcategory.id) 

  end

  def edit

  end

  private def carc_params 
    params.require(:car_category).permit(:name, :daily_rate, :car_insurance, :third_part_insurance)
  end

  private  def id
    id = params[:id]
  end

end
