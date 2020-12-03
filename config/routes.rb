Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/registration', to: 'users#new', as: :registration
  resources :users, only: %i[create]
  get '/dashboard', to: 'dashboard#show'
  get '/discover', to: 'movies#new'
  get '/movies', to: 'movies#index'
  get '/', to: 'welcome#index'
  post '/sessions', to: 'sessions#create'
  get '/movies/:id', to: 'movies#show'
end
