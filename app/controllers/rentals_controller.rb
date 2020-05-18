class RentalsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
    @customers = Customer.all
    @car_categories = CarCategory.all
  end

  def create
    @rental = Rental.create(params.require(:rental).permit(:start_date, :end_date,
                                                            :customer_id, :car_category_jd))
    redirect_to rentals_path
  end

  #da pra fazer a busca na view também... no controller tbm é comum
  def search    
    @q = params[:q]
    @rental = Rental.find_by(code: @q.upcase) #find by e uma busca unica
    if @rental.blank? || @q.blank?
      @rentals = Rental.all
      flash.now[:alert] = "Nenhum resultado encontrado para: #{params[:q]}" #coloque o flash alert em application
      render :index
    end 
  end
end

