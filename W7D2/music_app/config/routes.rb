Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:create, :destroy, :new]
  resources :users, only: [:create, :new, :show]
  resources :bands

  resources :bands do 
    resources :albums, only: [:new, :index]
  end
  
  resources :albums, except: [:new, :index]

  root to: redirect('bands')
end
