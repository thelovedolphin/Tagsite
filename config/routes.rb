Rails.application.routes.draw do
  root "websites#index"

  resources :articles
  resources :tags
  resources :websites
end
