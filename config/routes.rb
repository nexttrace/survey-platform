Rails.application.routes.draw do
  # Survey takers
  passwordless_for :contacts, at: "/"
  resource :survey, only: [:show, :update]
  get "/survey/:step", to: "surveys#show", as: :survey_step
  get "/code/:id", to: "codes#show", as: :code

  # Public health agencies
  devise_for :users, path_prefix: "agency", controllers: {
    registrations: "users/registrations",
  }
  namespace :agency do
    resource :dashboard, only: [:show, :create]
    resources :contacts
  end

  # Public
  root to: "home#index"
  get '*unmatched_route', to: 'application#route_not_found'
end
