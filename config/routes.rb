Rails.application.routes.draw do

  get 'contacts/index'
  get 'residents/show'
  resources :demos

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
    resources :inquiry, only: [:index]
  end
  
  # dashboard
  get 'owner', to: 'owners#show'
  get 'owner/setting', to: 'owners#edit'
  post 'owner/setting', to: 'owners#update'
  get 'resident', to: 'residents#show'
  get 'resident/setting', to: 'residents#edit'
  post 'resident/setting', to: 'residents#update'
  
  namespace :owner do
    resources :houses do
      resources :rooms, only: [:create, :edit, :update, :destroy] do
        member do
          get "remove"
        end
      end
    end
    
    resources :residents, only: [:index, :show]
    resources :requests, only: [:index, :update, :destroy]
    resources :posts do
      collection do
        get "houses"
      end
    end
    resources :contacts, only: [:index, :edit, :update]
    resources :inquiries, only: [:new, :create]
  end
  
  namespace :resident do
    resources :houses, only: [:new, :create, :show]
    resources :contacts, only: [:index, :edit, :update]
    resources :posts, only: [:index, :show]
    resources :inquiries, only: [:new, :create]
  end
end
