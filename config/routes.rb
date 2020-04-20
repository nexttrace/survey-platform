Rails.application.routes.draw do
  passwordless_for :respondants, at: "/survey"

  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  get "survey", to: "survey/index"
  root "home#index"
end
