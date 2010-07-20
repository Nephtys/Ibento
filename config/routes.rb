Ibento::Application.routes.draw do |map|
  
  put "events/update_participation"
  put "events/update_map"
  put "events/search"
  match "events/auto_complete_for_search_email" => "events#auto_complete_for_search_email"
  resources :events
  resources :geo_maps

  resource :login, :only => [:new, :create]

  match 'home' => "home#show"

  match 'logout' => 'logins#destroy'

  root :to => "home#show"
  
end
