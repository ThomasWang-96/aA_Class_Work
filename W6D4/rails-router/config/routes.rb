Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  # get 'users', to: 'users#index', as: 'users'
  # get 'users/:id', to: 'users#show', as: 'user'
  # get 'users/new', to: 'users#new', as:'new_user'
  # post 'users', to: 'users#create'
  # get 'users/:id/edit', to:'users#edit', as:'edit_user'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

  # users/1/artworks => artworks owned by 1 & shared by 1
  # get 'users/:id/artworks'
  
  # users/author_id? user_id? /comments
  # artworks/artwork_id/comments

  resources :users do 
      resources :artworks, only: [:index]
      # resources :comments, only: [:index]
  end

  # resources :artworks do
  #     resources :comments, only: [:index]
  # end

  resources :users, only: [:show, :update, :create, :destroy]
  resources :artworks, only: [:index, :show, :update, :create, :destroy]
  resources :artwork_shares, only: [:create, :destroy]
  # resources :comments, only: [:create, :destory]
  resources :comments, only: [:index, :create, :destory]
  resources :likes, only: [:index, :create, :destroy, :show]
  
  
end
