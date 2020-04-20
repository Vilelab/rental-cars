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
    @subsidiary = Subsidiary.find(params[:id])
    @subsidiary.update(params.require(:subsidiary).permit(:name, :cnpj, :address))
    redirect_to subsidiary_path
  end
end
