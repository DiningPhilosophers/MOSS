Rails.application.routes.draw do

  #get 'password_resets/new'

  #get 'password_resets/edit'

  get 'visitors_statistics/show', as: 'visitors_statistics'
  get 'session/new'

  # TODO we should remove those resources or make them available to admins only
  resources :admins, only: [:create, :edit, :update, :new] # TODO We should probably remove this and do this manualy. We do not want somebody to get admins' data by visiting /admins/2
  resources :countries
  resources :zipcodes
  resources :surveys
  resources :questions
  resources :groups
  resources :visitors

  # resource :visitors do
  #   get 'filter_area'
  # end

  get 'filter_area'  => 'visitors#filter_area'

  get 'charts' => 'visitors_statistics#charts'

  get 'homepage/index'

  #root 'homepage#index'
  root 'groups#new'

  # Routes for administrator login system
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  # Routes for adding a new administrator
  get 'signup'  => 'admins#new'

  # Visitor sing in
  get 'signin' => 'groups#new', as: 'sign_in'

  # Password reset
  resources :password_resets, only: [:create, :edit, :update]

  resource :visitors_statistics do
    get 'visitors_in_date'
  end

  #export
  get 'export', to: 'visitors#export', as: :visitors_export

end
