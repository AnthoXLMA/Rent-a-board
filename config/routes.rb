Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  devise_scope :user do
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :new, :create, :show] do
    resources :boards, only: [:index, :new, :create, :show]
  end

  resources :boards, only: [:index, :show, :new, :create] do
    resources :users, only: [:index, :new, :create, :show]
  end

  resources :boards, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:index, :new, :create, :show]
  end

  resources :users, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:index, :new, :create, :show]
  end

  resources :bookings, only: [:index, :new, :create, :show] do
    resources :users, only: [:index, :new, :create, :show]
  end

  resources :users, only: [:index, :new, :create, :show] do
      resources :boards, only: [:index, :new, :create, :show] do
        resources :bookings, only: [:index, :new, :create, :show]
    end
  end

  namespace :users do
    resources :boards, only: [:index, :new, :create, :show]
    resources :bookings, only: [:index, :new, :create, :show] do
      member do
        patch :accept
        patch :refuse
      end
    end
  end
end
