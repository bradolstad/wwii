Wwii::Application.routes.draw do

  root :to => 'Campaigns#index'

  get "login" => "Sessions#new", as:"login"

  post "login" => "Sessions#create"

  delete "logout"=>"Sessions#destroy", as:"logout"

  get "logout"=>"Sessions#destroy"

  resources :users
  resources :unit_classes
  resources :operations
  resources :campaigns
  resources :units
  resources :events
  resources :countries
  resources :event_types

end
