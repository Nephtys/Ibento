Ibento::Application.routes.draw do |map|

  put "events/update_participation"
  resources :events, :only => [:show]

  resource :login, :only => [:new, :create]

  match 'home' => "home#show"

  match 'logout' => 'logins#destroy'

  root :to => "home#show"
  
end
