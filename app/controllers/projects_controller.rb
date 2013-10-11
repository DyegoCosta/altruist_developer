class ProjectsController < InheritedResources::Base 
  before_action :set_project, except: [:index, :new, :create]
  before_action :authenticate_organization!, except: [:index, :show]
  before_action :authenticate_developer!, only: [:lead]
  before_action :authenticate_ownership!, only: [:edit, :update, :destroy]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(permitted_params)
    @project.organization = current_organization
    create!
  end

  def lead
    project = Project.find params[:project_id]
    project.lead current_developer
  end

  private
    def permitted_params
      params.require(:project).permit(:title, :description)
    end

    def set_project
      @project = Project.find(params[:id])
    end

    def authenticate_ownership!
      unless @project.organization == current_organization
        flash[:error] = 'You can not alter this project'
        redirect_to projects_path
      end
    end
end
