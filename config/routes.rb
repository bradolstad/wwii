Wwii::Application.routes.draw do

  root :to => 'Campaigns#index'

  get 'operations/:id' => 'Operations#show', :as => 'operation'
  get 'operations' => 'Operations#index', :as => 'operations'

  get 'campaigns/:id' => 'Campaigns#show', :as => 'campaign'

  get 'campaigns' => 'Campaigns#index', :as => 'campaigns'

  get 'streams' => 'Streams#index', :as => 'streams'

end
