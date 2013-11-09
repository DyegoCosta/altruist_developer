class HomeController < ApplicationController
  def index
    redirect_to projects_path if signed_in?
  end

  def about
  end
end
