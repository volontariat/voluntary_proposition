class Proposition::UnitsController < ApplicationController
  include Proposition::BaseController
  include Applicat::Mvc::Controller::Resource
  
  before_filter :find_unit, only: [:new]
  
  load_and_authorize_resource
  
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
  respond_to :html, :js, :json
  
  def index
    @organization = find_parent Proposition::Unit::PARENT_TYPES
    @units = @organization.proposition_units.roots
      
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @organization = @unit.organization
    @units = @unit.children
  end
  
  def new
  end
  
  def create
    @unit = Proposition::Unit.new(params[:proposition_unit])
    @organization = @unit.organization
    
    if @unit.save
      redirect_to @unit, notice: t('general.form.successfully_created')
    else
      render :new
    end
  end
  
  def edit
    @organization = @unit.organization
  end
  
  def update
    @organization = @unit.organization
    
    if @unit.update_attributes(params[:proposition_unit])
      redirect_to @unit, notice: t('general.form.successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    @unit.destroy
    redirect_to organization_proposition_units_path(@unit.organization), notice: t('general.form.destroyed')
  end
  
  def resource
    @unit
  end
  
  private
  
  def not_found
    redirect_to proposition_product_path, notice: t('units.exceptions.not_found')
  end
  
  def find_unit
    @organization = Organization.friendly.find(params[:organization_id]) if params[:organization_id].present?
    @unit = @organization.proposition_units.new params[:proposition_unit]
  end
end