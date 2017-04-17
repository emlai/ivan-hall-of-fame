Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'scores#index'
  get '/highscores', to: 'scores#csv'
  post '/submit_score', to: 'scores#submit_score'
  get '/players', to: 'players#index'
  resources :versions, only: [:index, :show], :id => /.*/
  get '/signup', to: 'players#new'
  get '/get_auth_token', to: 'players#get_auth_token'
  post '/players', to: 'players#create'
end
