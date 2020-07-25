Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:create, :destroy, :new]
  resource :session, only: [:create, :destroy, :new]
  resources :subs, except: [:destroy]
  resources :posts, except: [:index]
  resources :comments, only: [:create, :show]

  resources :posts do 
    resource :comments, only: [:new]
  end

  root 'subs#index'
end
