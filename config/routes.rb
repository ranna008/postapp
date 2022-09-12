Rails.application.routes.draw do
  # resources :comments
  root :to => "pages#home"
  get 'pages/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts do
  	resources :comments
    resources :favourites, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout', to:'sessions#destroy'
end
