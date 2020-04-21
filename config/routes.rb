Rails.application.routes.draw do
  passwordless_for :respondants

  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  get "dashboard", to: "dashboard#index"
  resources :surveys
  resources :survey_invitations

  root to: "home#index"
end
