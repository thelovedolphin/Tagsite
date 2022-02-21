Rails.application.routes.draw do
  root "websites#index"

  get "websites/admin", to: "websites#admin"
  resources :websites
end
