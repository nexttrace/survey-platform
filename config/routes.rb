Rails.application.routes.draw do
  passwordless_for :respondants

  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  get "survey", to: "survey#index"
  root to: "home#index"
end
