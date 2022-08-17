Rails.application.routes.draw do
  root "static_page#top"
  resources :users, only: %i[new create update]
  resources :posts
  resources :checklists
  resources :items do
    collection do
      get :select_category
    end
  end
  resources :myitems, only: %i[create destroy]
  get "search_camps",  to: "search_camps#search"
  get "search_items",  to: "search_items#search"
  get "login",         to: "user_sessions#new"
  post "login",        to: "user_sessions#create"
  delete "logout",     to: "user_sessions#destroy"
end
