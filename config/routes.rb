RaidMe::Application.routes.draw do

  resources :fridges

  resources :products

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, :path_prefix => 'my'

  resources :users
  
  root :to => 'static_pages#home'
  match '/about', :to => 'static_pages#about'
  match '/imprint', :to => 'static_pages#imprint'



end
