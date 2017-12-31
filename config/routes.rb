Rails.application.routes.draw do
 root to: 'toppages#index'
 
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 
 get 'signup', to: 'users#new'
 resources :users, only: [:show, :new, :create] do
  member do
    get :wants
    get :likes
    end
  end
 resources :articles, only: [:index, :show, :new, :create, :destroy, :edit, :update]
 
 resources :ownerships, only: [:create, :destroy]
 
 get 'rankings/want', to: 'rankings#want'
 get 'rankings/like', to: 'rankings#like'
 get 'rankings/userlike', to: 'rankings#like'
 get 'rankings/userwant', to: 'rankings#want'

 
 resources :categories, only: [:index]
 
 get 'toppages/newarrival', to: 'toppages#newarrival'
 
end
