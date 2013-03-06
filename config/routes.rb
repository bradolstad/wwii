Wwii::Application.routes.draw do

<<<<<<< HEAD
  resources :campaigns
=======
  resources :events


  resources :countries


  resources :units


  root :to => 'Campaigns#index'
>>>>>>> 72bf35c6f514cac65902391c13fb3d0a9d644fb6


  root :to => 'Campaigns#index'

  resources :operations
  resources :campaigns
  resources :units
  resources :events
  resources :countries

  get 'streams' => 'Streams#index', :as => 'streams'

end
