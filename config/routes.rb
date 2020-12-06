Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # welcome
  get '/', to: 'welcome#index', as: :welcome

  # users
  get '/registration', to: 'users#new', as: :registration
  resources :users, only: %i[create]

  # dashboard
  resources :dashboard, only: %i[index]

  # discover
  resources :discover, only: %i[index]

  # movies
  resources :movies, only: %i[index show]

  # sessions
  resources :sessions, only: %i[create]

  # events
  resources :events, only: %i[new]

  # Friendships
  resources :friendships, only: %i[create]
end
