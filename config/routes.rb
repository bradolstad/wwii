Wwii::Application.routes.draw do

  root :to => 'Campaigns#index'

  resources :operations
  resources :campaigns
  resources :units
  resources :events
  resources :countries
  resources :event_types

end
