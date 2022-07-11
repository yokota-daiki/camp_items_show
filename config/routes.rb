Rails.application.routes.draw do
  root "top_page#top"
  resources :users, only: %i[new create update]
end
