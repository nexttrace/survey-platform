Rails.application.routes.draw do
  passwordless_for :users, at: "/"
  root "home#index"
end
