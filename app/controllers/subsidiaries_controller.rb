class SubsidiariesController < ApplicationController
  def index
    @subsidiaries = Subsidiary.all
  end

  def show
    @subsidiary = Subsidiary.find(params[:id])
  end

  def new
    @subsidiary = Subsidiary.new
  end

  def create
   @subsidiary = Subsidiary.new(params.require(:subsidiary).permit(:name, :cnpj, :address))
   @subsidiary.save
   redirect_to @subsidiary
  end

  def edit
    @subsidiary = Subsidiary.find(params[:id])
  end

  def update

  end
end
