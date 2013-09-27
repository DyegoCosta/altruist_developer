class ProjectsController < InheritedResources::Base 
  before_action :set_project, except: [:index, :new, :create]
  before_action :authenticate_organization!, except: [:index, :show]
  before_action :authenticate_ownership!, only: [:edit, :update, :destroy]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(permitted_params)
    @project.organization = current_organization
    create!
  end

  private
    def permitted_params
      params.require(:project).permit(:title, :description, :repository_url, :status)
    end

    def set_project
      @project = Project.find(params[:id])
    end

    def authenticate_ownership!
      unless @project.organization == current_organization
        redirect_to projects_path
      end
    end
end
