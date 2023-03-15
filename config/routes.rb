Rails.application.routes.draw do
  root 'static_page#top'
  resources :users, only: %i[new create]
  resources :posts, only: %i[index new create edit update destroy]
  resources :checklists, only: %i[index new create edit update destroy]
  resources :items, only: %i[index new create] do
    collection do
      get :select_category
    end
  end
  resources :password_resets, only: %i[new create edit update]
  resources :myitems, only: %i[create destroy]
  resources :bookmark_camps, only: %i[create destroy index]
  namespace :admin do
    resources :users, only: %i[index edit update destroy]
    resources :posts, only: %i[index destroy]
    resources :items, only: %i[index destroy]
  end
  get 'reload', to: 'static_page#reload'
  get 'terms_of_service', to: 'static_page#terms_of_service'
  get 'privacy_policy', to: 'static_page#privacy_policy'
  get 'search_camps',  to: 'search_camps#search'
  get 'search_items',  to: 'search_items#search'
  get 'login',         to: 'user_sessions#new'
  post 'login',        to: 'user_sessions#create'
  delete 'logout',     to: 'user_sessions#destroy'
  post 'guest_login',  to: 'user_sessions#guest_login'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  get '/sitemap', to: redirect("https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/sitemap.xml.gz")
end
