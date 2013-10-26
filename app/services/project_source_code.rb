class ProjectSourceCode
  def self.start_repository(project, developer, repository_name)
    raise Exception.new("Only the project team leader can start it's repository") unless project.leaded_by? developer

    repository = github_repositories.create name: repository_name, org: ENV['GITHUB_ORG']

    project.repository_url = repository[:html_url]
    project.save

    repository[:html_url]
  end

  private
    def self.github_repositories
      Github::Repos.new do |config|
        config.org = ENV['GITHUB_ORG'] 
        config.login = ENV['GITHUB_LOGIN']
        config.password = ENV['GITHUB_PASSWORD']
      end
    end
end
