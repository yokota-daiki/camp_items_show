Rails.application.routes.draw do
  root "static_page#top"
  resources :users, only: %i[new create update]
  resources :posts
  resources :checklists
  resources :items 
  resource :search_item, only: %i[create] do
    collection do
      get :search
    end
  end
  post "search_items", to: "search_items#create"
  get "login",         to: "user_sessions#new"
  post "login",        to: "user_sessions#create"
  delete "logout",     to: "user_sessions#destroy"
end
