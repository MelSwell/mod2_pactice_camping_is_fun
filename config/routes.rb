Rails.application.routes.draw do
  resources :signups, only: [:new, :create]
  resources :activities, only: [:index, :show]
  resources :campers, only: [:index, :show, :new, :create]
  get '/campers/:id/signups/new', to: 'signups#camper_signup', as: 'camper_signup'
  post '/campers/:id/signups', to: 'signups#create_camper_signup', as: 'create_camper_signup'
  get '/activities/:id/signups/new', to: 'signups#activity_signup', as: 'activity_signup'
  post '/activities/:id/signups', to: 'signups#create_activity_signup', as: 'create_activity_signup'
end
