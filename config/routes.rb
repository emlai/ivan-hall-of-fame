Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'scores#index'
  get '/highscores', to: 'scores#csv'
  post '/submit_score', to: 'scores#submit_score'
end
