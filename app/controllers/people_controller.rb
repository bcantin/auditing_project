class PeopleController < ApplicationController

  def index
    @people = Person.all
  end
  
  def show
    @person = Person.find(params[:id])
  end
  
  def new
    @person = Person.new
  end
  
  def create
    # render :text => params.inspect
    @person = Person.new(params[:person])
    if @person.save
      flash[:notice] = 'Person created'
      redirect_to @person
    else
      render :new
    end
  end
  
  def edit
    @person = Person.find(params[:id])
  end
  
  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(params[:person])
      flash[:notice] = 'Person updated'
      redirect_to @person
    else
      render :edit
    end
  end
  
  def destroy
    Person.destroy(params[:id])
    flash[:notice] = 'Person destroyed'
    redirect_to people_path
  end

end
