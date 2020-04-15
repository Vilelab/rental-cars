class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
   @customer = Customer.new(params.require(:customer).permit(:name, :document, :email))
   @customer.save
   redirect_to @customer
  end

  def show
    @customer = Customer.find(params[:id])
  end

end
