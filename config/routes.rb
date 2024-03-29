Rails.application.routes.draw do

  get 'invoices/index'
  get 'invoices/create'
  get 'invoices/show'
  ########common#######
  root to: 'statics#index'
  post 'inquiry', to: 'statics#inquiry'
  get 'privacy', to: 'statics#privacy'
  get 'flyer', to: 'statics#flyer'
  get 'tokutei', to: "statics#tokutei"
  get 'post_sample', to: 'statics#post_sample'
  get 'select_user', to: 'statics#select_user'
  resources :demos
  
  #######admin######
  namespace :admin do
    root to: 'owners#index'
    resources :inquiry, only: [:index]
    resources :owners
    resources :residents
    resources :bills
  end
  
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations',
    confirmations: 'admins/confirmations'
  }

  ##########owner###########
  devise_for :owners, controllers: {
    sessions:      'owners/sessions',
    passwords:     'owners/passwords',
    registrations: 'owners/registrations',
    confirmations: "owners/confirmations"
  }
  devise_scope :owner do
    get 'owners/registrations/invitation_owner', to: "owners/registrations#invitation_owner"
  end
  # dashboard
  get 'owner', to: 'owners#show'
  get 'owner/setting', to: 'owners#edit'
  post 'owner/setting', to: 'owners#update'
  post 'owner/card', to: "owners#card"
  
  namespace :owner do
    resources :houses do
      resources :rooms, only: [:create, :edit, :update, :destroy] do
        member do
          get "remove"
        end
        collection do
          get "resident"
        end
      end
    end

    post "room_resident", to: "room_residents#update"
    
    resources :residents, only: [:index, :show]
    resources :requests, only: [:index, :update, :destroy]
    resources :posts do
      collection do
        get "houses"
      end
      member do
        get "read_status"
        get "setting"
        patch "update_setting"
      end
    end
    resources :contacts, only: [:index, :new, :edit, :update] do
      member do
        get "read"
      end
    end
    resources :inquiries, only: [:new, :create]
    resources :phone_lists, only: [:index, :show]
    resources :invoices, only: [:index, :create, :show]
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
