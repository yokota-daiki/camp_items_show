Rails.application.routes.draw do
  root "static_page#top"
  resources :users, only: %i[new create update]
  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
end
