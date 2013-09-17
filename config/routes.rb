AltruistDeveloper::Application.routes.draw do
  resources :projects

  devise_for :organizations
  devise_for :developers
  root "home#index"
end
