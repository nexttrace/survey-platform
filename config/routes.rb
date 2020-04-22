Rails.application.routes.draw do
  # Survey and respondents
  passwordless_for :respondents, at: "/survey"
  resources :codes, only: [:show]

  get "response/thank_you", to: "responses#thank_you"
  get "response/:step", to: "responses#show", as: :response_step
  resource :response, only: [:show]

  # Public health agencies
  devise_for :users, at: "/agency", controllers: {
    registrations: "users/registrations",
  }
  get "dashboard", to: "dashboard#index"
  resources :survey_invitations

  # Public
  root to: "home#index"
end
