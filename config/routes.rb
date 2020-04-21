Rails.application.routes.draw do
  resources :survey_invitations
  passwordless_for :respondants

  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  get "survey", to: "survey#index"
  get "dashboard", to: "dashboard#index"
  root to: "home#index"
end
