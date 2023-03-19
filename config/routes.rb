Rails.application.routes.draw do
  get 'logout' => 'session#destroy', :as => 'logout'
  get 'login' => 'session#new', :as => 'login'
  post 'login' => 'session#create'
  resources :users do
    resources :notes
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#login"
end
