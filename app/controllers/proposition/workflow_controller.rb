class Proposition::WorkflowController < ApplicationController
  include ::VoluntaryProposition::BaseController
  
  before_filter :authenticate_user!
  
  def index
    @twitter_sidenav_level = 2
    @sidenav_links_count = 1
  end
end