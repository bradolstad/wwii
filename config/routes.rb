Wwii::Application.routes.draw do
  root :to => "Company#index"

  get "companies" => "Company#index"

end
