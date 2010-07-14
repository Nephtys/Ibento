Ibento::Application.routes.draw do |map|

  resource :login, :only => [:new, :create]

  match 'logout' => 'logins#destroy'

  root :to => "logins#new"
  
end
