class TeamMembersController < ApplicationController
  before_action :authenticate_developer!
  before_action :set_project

  def create
    unless @project.set_leader current_developer
      head :precondition_failed and return
    end
    
    head :created
  end

  private
    def set_project
      @project = Project.find params[:project_id]
    rescue ActiveRecord::RecordNotFound 
      flash[:error] = 'The project you are looking ' +
                      'for could not be found.'

      redirect_to root_path
    end
end
