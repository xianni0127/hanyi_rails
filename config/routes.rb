Rails.application.routes.draw do
  require 'sidekiq/web'
  resources :users
  get 'pages/info'
  # post "/children", to:  "login#login"

  # scope "/:locale" do
    resources :children
  # end

  # get '/:locale' =>'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    #  root to: redirect('/children')

   root 'login#index'
  # get 'login' =>'login#new'
  # post 'login' => 'login#create'
  # delete 'logout' => 'logins#destroy'

  post "/", to:  "login#login"

  mount Sidekiq::Web => '/sidekiq'
end
