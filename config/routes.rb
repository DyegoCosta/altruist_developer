AltruistDeveloper::Application.routes.draw do
  devise_for :organizations
  devise_for :developers
  root "home#index"
end
