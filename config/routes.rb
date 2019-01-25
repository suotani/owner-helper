Rails.application.routes.draw do

  get 'contacts/index'
  get 'residents/show'
  resources :demos
  root to: "top#index"

  get 'top/index'
  devise_for :owners, controllers: {
    sessions:      'owners/sessions',
    passwords:     'owners/passwords',
    registrations: 'owners/registrations',
    confirmations: "owners/confirmations"
  }

  devise_for :residents, controllers: {
    sessions:      'residents/sessions',
    passwords:     'residents/passwords',
    registrations: 'residents/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: 'owners#index'
  end
  
  # dashboard
  get 'owner', to: 'owners#show'
  get 'resident', to: 'residents#show'
  
  namespace :owner do
    resources :houses do
      resources :rooms, only: [:create, :edit, :update, :destroy]
    end
    
    resources :residents, only: [:index, :show]
    resources :requests, only: [:index, :update, :destroy]
    resources :posts, except: [:show]
    resources :contact, only: [:index]
  end
  
  namespace :resident do
    resources :houses, only: [:new, :create, :show]
    resources :contact, only: [:index]
  end
end
