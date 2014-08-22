class Proposition::Workflow::OrganizationOwnerController < ApplicationController
  include ::VoluntaryProposition::BaseController
  
  before_filter :authenticate_user!
  
  def index
  end
end