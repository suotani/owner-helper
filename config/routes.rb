Rails.application.routes.draw do

  devise_for :owners, controllers: {
    sessions:      'owners/sessions',
    passwords:     'owners/passwords',
    registrations: 'owners/registrations'
  }

  devise_for :residents, controllers: {
    sessions:      'residents/sessions',
    passwords:     'residents/passwords',
    registrations: 'residents/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'owners#index'
end
