Rails.application.routes.draw do
  root "websites#index"

  resources :tags
  resources :websites
end
