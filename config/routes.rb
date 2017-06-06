Rails.application.routes.draw do
  #root 'home#index'

  devise_for :users, controllers: { registrations: "registrations" }

  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
  end  

  resources :users do
    resources :groups, only: [:new, :create, :show, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :channels, only: [:new, :create, :show, :index]

  mount ActionCable.server => '/cable'

  root to: 'view#landing'


end
