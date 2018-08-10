Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmlt
  get '/roles/index', to: 'roles#index'
  get '/roles/new', to: 'roles#new'
  post 'roles/create', to: 'roles#create'
  post 'roles/hide_roles', to: 'roles#hide_roles'


  get '/users/index', to: 'user#index'
  get '/users/new', to: 'user#new'
  post 'users/create', to: 'user#create'
  get 'users/show_all_users', to: 'user#show_all_users'
end
