Rails.application.routes.draw do
  require 'sidekiq/web'
  resources :users
  get 'pages/info'

  resources :children
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('/children')

  mount Sidekiq::Web => '/sidekiq'
end
