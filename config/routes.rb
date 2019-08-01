Rails.application.routes.draw do
  root to: 'boats#index'

  devise_for :users
  get 'bookings/history', to: 'bookings#history', as: :history

  resources :boats do
    resources :bookings, only: [:index, :new, :create]
  end

  resources :bookings, only: [:index, :new, :create] do
    resources :reviews, only: [:new, :create, :destroy]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
