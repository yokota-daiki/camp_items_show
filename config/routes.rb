Rails.application.routes.draw do
  root "static_page#top"
  resources :users, only: %i[new create update]
  resources :posts
  resources :checklists
  resources :items do
    collection do
      get "search", to: "search_items#search"
    end
  end
  get "login",     to: "user_sessions#new"
  post "login",    to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"
end
