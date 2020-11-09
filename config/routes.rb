Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  resources :stories do
    member do
      post :clap
    end
    resources :comments, only: [:create]
  end

  # /@kamitsuTW/文章標題-123
  get '@:username/:story_id', to: 'pages#show', as: 'story_page'

  # /@kamitsuTW/
  get '@:username', to: 'pages#user', as: 'user_page'

  get "/demo", to: 'pages#demo'
  root 'pages#index'
end
