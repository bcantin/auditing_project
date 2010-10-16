class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end
  
  def show
    @company = Company.find(params[:id])
  end
  
  def new
    @company = Company.new
  end
  
  def create
    # render :text => params.inspect
    @company = Company.new(params[:company])
    if @company.save
      flash[:notice] = 'Company created'
      redirect_to @company
    else
      render :new
    end
  end
  
  def edit
    @company = Company.find(params[:id])
  end
  
  def update
    # render :text => params.inspect
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      flash[:notice] = 'Company updated'
      redirect_to @company
    else
      render :edit
    end
  end
  
  def destroy
    # render :text => params.inspect
    
    @company = Company.find(params[:id])
  end
end
