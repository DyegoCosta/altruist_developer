class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper :path

  def after_sign_in_path_for(resource)
    projects_path
  end
end
