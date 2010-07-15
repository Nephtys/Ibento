Ibento::Application.routes.draw do |map|
  
  resources :events, :only => [:show]

  resource :login, :only => [:new, :create]

  match 'home' => "home#show"

  match 'logout' => 'logins#destroy'

  root :to => "logins#new"
  
end
