AltruistDeveloper::Application.routes.draw do
  root "home#index"

  resources :projects do
    post :team_members, to: 'team_members#create'
  end

  devise_for :organizations

  devise_for :developers, controllers: { omniauth_callbacks: 'developers/omniauth_callbacks' }
  devise_scope :developer do
    get 'developers/sign_in', to: redirect('/developers/auth/github'), as: :new_developer_session
    delete 'developers/sign_out', to: 'devise/sessions#destroy', as: :destroy_developer_session
  end
end
