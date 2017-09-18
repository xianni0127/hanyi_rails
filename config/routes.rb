Rails.application.routes.draw do
  require 'sidekiq/web'
  resources :users
  get 'pages/info'
  # post "/children", to:  "login#login"


  resources :children
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
     root to: redirect('/children')

  #  root 'login#index'
  post "/", to:  "login#login"

  mount Sidekiq::Web => '/sidekiq'
end
