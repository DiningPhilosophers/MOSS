Rails.application.routes.draw do

  get 'visitors_statistics/show'
  get 'session/new'

  # TODO we should remove those resources or make them available to admins only
  resources :admins # TODO We should probably remove this and do this manualy. We do not want somebody to get admins' data by visiting /admins/2
  resources :countries
  resources :zipcodes
  resources :surveys
  resources :questions
  resources :groups
  resources :visitors
  get 'homepage/index'

  root 'homepage#index'

  # Routes for administrator login system
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  # Routes for adding a new administrator
  get 'signup'  => 'admins#new'

  # Visitor sing in
  get 'signin' => 'groups#new', as: 'sign_in'
end