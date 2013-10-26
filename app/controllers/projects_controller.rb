class ProjectsController < InheritedResources::Base 
  before_action :set_project, except: [:index, :new, :create]
  before_action :authenticate_organization!, except: [:index, :show, :start_repository]
  before_action :authenticate_developer!, only: [:start_repository]
  before_action :authenticate_ownership!, only: [:edit, :update, :destroy]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(permitted_params)
    @project.organization = current_organization
    create!
  end

  def start_repository
    unless(repository_url = ProjectSourceCode.start_repository @project, current_developer, params[:repository_name])
      head :bad_request and return
    end

    head :created, location: repository_url and return
  end

  private
    def permitted_params
      params.require(:project).permit(:title, :description)
    end

    def set_project
      @project = Project.find params[:id] || params[:project_id]
    end

    def authenticate_ownership!
      unless @project.organization == current_organization
        flash[:error] = 'You can not alter this project'
        redirect_to projects_path
      end
    end
end
