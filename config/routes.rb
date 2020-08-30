Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boards, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :new, :create]

  namespace :owner do
    resources :boards, only: [:index]
    resources :bookings, only: [:index] do
      member do
        patch :accept
        patch :refuse
      end
    end
  end
end
