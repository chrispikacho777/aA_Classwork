Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :create, :destroy, :update] do 
    resources :artworks, only: [:index]
  end
  resources :artworks, only: [:index, :show, :create, :destroy, :update]
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:index, :create, :destroy]
  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show' 
  # get '/users/new', to: 'users#new'
  # post '/users', to: 'users#create'
  # get '/users/:id/edit', to: 'users#edit'
  # patch '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#delete'
end
