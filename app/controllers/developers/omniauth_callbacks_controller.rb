class Developers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    developer = Developer.from_github_auth_hash(request.env['omniauth.auth'])

    if developer.persisted?
      sign_in_and_redirect developer, event: :authentication
    else
      redirect_to root_path
    end
  end
end
