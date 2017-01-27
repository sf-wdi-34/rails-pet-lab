Rails.application.routes.draw do

  root "site#index"

  get '/signup' => 'owners#new'
  # post '/owners' => 'owners#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :owners do
    resources :pets, only: [:index, :new, :create]
  end
  resources :pets, only: :show
end
