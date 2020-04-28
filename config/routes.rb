Rails.application.routes.draw do
  # Survey and respondents
  passwordless_for :respondents, at: "/survey"
  resources :codes, only: [:show]

  resource :survey, only: [:show, :update]
  get "/survey/:step", to: "surveys#show", as: :survey_step

  # Public health agencies
  devise_for :users, at: "/agency", controllers: {
    registrations: "users/registrations",
  }
  get "/dashboard", to: "dashboard#index"
  resources :survey_invitations

  # Public
  root to: "home#index"
end
