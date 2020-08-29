Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boards, only: [:index, :new, :create, :show] do
    resources :rentals, only: [:new, :create]
  end

  resources :rentals, only: [:index, :new, :create]

  namespace :owner do
    resources :boards, only: [:index]
    resources :rentals, only: [:index] do
      member do
        patch :accept
        patch :refuse
      end
    end
  end
end
