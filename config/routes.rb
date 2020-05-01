Rails.application.routes.draw do
  # Survey respondents
  passwordless_for :respondents, at: "/"
  resources :codes, only: [:show]
  resource :survey, only: [:show, :update]
  get "/survey/:step", to: "surveys#show", as: :survey_step

  # Public health agencies
  devise_for :users, path_prefix: "agency", controllers: {
    registrations: "users/registrations",
  }
  namespace :agency do
    resource :dashboard, only: [:show]
    resources :survey_invitations
  end

  # Public
  root to: "home#index"
end
