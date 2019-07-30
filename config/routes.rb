Rails.application.routes.draw do
  root to: 'boats#index'

  devise_for :users

  resources :boats do
    resources :bookings, only: [:index, :new, :create]
  end

  get 'bookings', to: 'bookings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
