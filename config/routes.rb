Rails.application.routes.draw do
  resources :collection_notes
  resources :collections
  get 'logout' => 'session#destroy', :as => 'logout'
  get 'login' => 'session#new', :as => 'login'
  post 'login' => 'session#create'
  delete 'users/:user_id/notes/:id', to: 'notes#destroy', as: 'destroy_user_note'
  resources :users do
    resources :notes 
    resources :collections
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  root "users#login"
end
