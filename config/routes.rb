Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'home#dashboard', as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :punches

  resource :profile, only: [:edit, :update, :change_password] do
    collection do
      patch 'change_password'
    end
  end
end
