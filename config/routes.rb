Rails.application.routes.draw do
  root :to => "pages#index"
  get '/' => 'pages#index'
  get '/login' => 'session#new'
  post '/login' => 'session#login'
  get '/logout' => 'session#logout'
  get '/register' => 'users#new'
  post '/addresses' => 'address#convert'

  resources :users, only: [:index, :new, :create, :edit, :show]
  resources :teams, only: [:index, :new, :create, :edit, :show] do
    resources :registrations
  end
  resources :games, only: [:index, :new, :create, :edit, :show] do
      resources :invitations
  end
  patch 'games/:id' => 'games#update'
  # resources :invitations
  resources :leagues
  resources :seasons
end
