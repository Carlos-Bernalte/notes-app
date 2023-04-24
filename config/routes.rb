Rails.application.routes.draw do
  resources :friendships
  resources :collection_notes
  resources :collections
  get 'logout' => 'session#destroy', :as => 'logout'
  get 'login' => 'session#new', :as => 'login'
  post 'login' => 'session#create'
  delete 'users/:user_id/notes/:id', to: 'notes#destroy', as: 'destroy_user_note'
  resources :users do
    resources :notes do
      get 'share' => 'notes#share', :as => 'share'
      post 'share_with_friend' => 'notes#share_with_friend'
      post 'unshare_with_friend' => 'notes#unshare_with_friend'
    end
    resources :collections
    resources :friendships, only: [:index, :create, :update, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  root "users#login"
end
