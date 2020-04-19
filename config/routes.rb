Rails.application.routes.draw do
  passwordless_for :users, at: "/"

  get "survey", to: "survey#index"
  resources :responses
  resources :organizations

  root "home#index"
end
