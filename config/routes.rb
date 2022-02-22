Rails.application.routes.draw do
  root "websites#index"

  
  get "websites/admin", to: "websites#admin"
  resources :websites
  get "tags/new", to: "tags#new", as: "new_tag"
  post "tags/new", to: "tags#create"
end
