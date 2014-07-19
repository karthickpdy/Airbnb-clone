class PropertiesController < ApplicationController
  
  include ApplicationHelper

  def index   
    @properties= Property.index_result params,current_user;
  end

  def search
     @properties =Property.return_search_result(params);
  end

  def show
    @property = Property.find(params[:id])

  end

  # GET /properties/new
  # GET /properties/new.xml
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
    @property = Property.find(params[:id])
  end

  # POST /properties
  # POST /properties.xml
  def create
   handle_redirection  Property.create_properties params,current_user
  end
  
  # PUT /properties/1
  # PUT /properties/1.xml
  def update
    handle_redirection Property.update_properties params,current_user 
  end

  # DELETE /properties/1
  # DELETE /properties/1.xml
  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to(properties_url(:mylisting=>true))   
      
  end
end
