class HomeController < ApplicationController
  def index
    if signed_in?
      return redirect_to projects_path
    else
      render layout: 'landing_page'
    end
  end
end
