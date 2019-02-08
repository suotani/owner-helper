Rails.application.routes.draw do

  ########common#######
  root to: 'statics#index'
  post 'inquiry', to: 'statics#inquiry'
  get 'privacy', to: 'static#privacy'
  resources :demos
  
  #######admin######
  namespace :admin do
    root to: 'owners#index'
    resources :inquiry, only: [:index]
  end

  ##########owner###########
  devise_for :owners, controllers: {
    sessions:      'owners/sessions',
    passwords:     'owners/passwords',
    registrations: 'owners/registrations',
    confirmations: "owners/confirmations"
  }
  # dashboard
  get 'owner', to: 'owners#show'
  get 'owner/setting', to: 'owners#edit'
  post 'owner/setting', to: 'owners#update'
  
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
    resources :contacts, only: [:index, :edit, :update] do
      member do
        get "read"
      end
    end
    resources :inquiries, only: [:new, :create]
  end

  ############resident#############
  devise_for :residents, controllers: {
    sessions:      'residents/sessions',
    passwords:     'residents/passwords',
    registrations: 'residents/registrations'
  }

  # dashboard
  get 'resident', to: 'residents#show'
  get 'resident/setting', to: 'residents#edit'
  post 'resident/setting', to: 'residents#update'
  
  namespace :resident do
    resources :houses, only: [:new, :create, :show]
    resources :contacts, only: [:index, :edit, :update] do
      member do
        get "read"
      end
    end
    resources :posts, only: [:index, :show] do
      member do
        get "read"
      end
    end
    resources :inquiries, only: [:new, :create]
  end
end
