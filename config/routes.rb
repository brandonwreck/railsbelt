Rails.application.routes.draw do
  get '/main' => 'users#index'
  post '/users' => 'users#create'
  post '/sessions' => 'sessions#create'
  get '/bright_ideas' => 'ideas#show'
  post '/ideas/:id' => 'ideas#create'
  post '/logout' => 'users#logout'
  post '/like/:id' => 'likes#create'
  get '/users/:id' => 'users#show'
  get '/bright_ideas/:id' => 'ideas#showid'
  delete '/ideas/:id' => 'ideas#destroy'
  end
