Wwii::Application.routes.draw do

  root :to => 'Campaigns#index'

  resources :operations
  resources :campaigns
  resources :units
  resources :events
  resources :countries

end
