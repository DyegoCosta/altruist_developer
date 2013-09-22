AltruistDeveloper::Application.routes.draw do
  resources :projects

  devise_for :organizations

  devise_for :developers, controllers: { omniauth_callbacks: 'developers/omniauth_callbacks' }
  devise_scope :developer do
    get 'sign_in', to: redirect('/developers/auth/github'), as: :new_developer_session
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_developer_session
  end

  root "home#index"
end
