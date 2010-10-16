class EmploymentsController < ApplicationController

  def new
    @resource   = get_proper_resource(params)
    @employment = @resource.employments.build
  end
  
  def create
    # render :text => params.inspect
    @resource   = get_proper_resource(params)
    @employment = @resource.employments.build(params[:employment])
    if @employment.save
      flash[:notice] = 'Employment created'
      redirect_to @resource
    else
      render :new
    end
  end
  
  def edit
    @resource = get_proper_resource(params)
    @employment = Employment.find(params[:id])
  end
  
  def update
    @resource = get_proper_resource(params)
    @employment = Employment.find(params[:id])
    if @employment.update_attributes(params[:employment])
      flash[:notice] = 'Employment updated'
      redirect_to @resource
    else
      render :edit
    end
  end
  
private
  
  def get_proper_resource(params)
    if params[:company_id]
      Company.find(params[:company_id])
    else 
      Person.find(params[:person_id])
    end
  end
  
end
