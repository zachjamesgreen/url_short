Rails.application.routes.draw do
  root 'home#index'
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'

  resources :links

  get '/home', to: 'home#index', as: 'home'

  get '/:slug', to: 'clicks#create'

end
