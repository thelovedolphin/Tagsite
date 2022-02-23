Rails.application.routes.draw do
  root "websites#index"

  
  get "websites/admin", to: "websites#admin", as: "website_admin"
  resources :websites
  resources :tags
end
