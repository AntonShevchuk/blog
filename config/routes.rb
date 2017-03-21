Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'index#index', as: 'root'
  get '/archive/:year/:month', to: 'pages#archive', as: 'archive'
  get '/category/:name', to: 'category#show_by_name', as: 'categoryname'

  resources :users
  resources :pages
  resources :categories
  resources :tags

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  namespace :admin do
    resources :users
  end
end
