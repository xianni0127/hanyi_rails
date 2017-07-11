Rails.application.routes.draw do
  get 'pages/info'

  resources :children
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('/children')
end