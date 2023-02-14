Rails.application.routes.draw do
  
  get 'sites/index'
  get 'sites/new'
  get 'sites/edit'
  resources :users, :only => [:new, :create, :index]
  root :to => 'pages#home'
  
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
