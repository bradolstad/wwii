Wwii::Application.routes.draw do

  root :to => 'Campaigns#index'

  resources :operations
  resources :campaigns
  resources :units
  resources :events
  resources :countries

  get 'streams' => 'Streams#index', :as => 'streams'

end
