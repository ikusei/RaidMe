RaidMe::Application.routes.draw do

  resources :fridge_friends, :only => [:index, :create, :destroy]

  resources :product_arrangements, :only => [:create, :destroy]

  resources :products, :only => [:new, :create, :destroy]

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, :path_prefix => 'my'

  resources :users, :only => [:index, :show]

 

  controller :search do
     match 'search/updatemap' => :update_map
  end
  
  root :to => 'static_pages#home'
  match '/about', :to => 'static_pages#about'
  match '/imprint', :to => 'static_pages#impressum'



end
