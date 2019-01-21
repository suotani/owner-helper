Rails.application.routes.draw do
  
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
  
  get 'owner', to: 'owners#show'
  
  namespace :owner do
    resources :houses do
      resources :rooms, only: [:create, :edit, :update, :destroy]
    end
  end
end
