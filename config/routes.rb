Rails.application.routes.draw do
  get 'notifications/index'
  root to: 'projects#index'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :projects do
    resources :collaborations, only: [:new, :create, :show, :index]

    resources :comments, only: [:index, :show, :new, :create]
    resources :hacker_days, only: [:new, :create, :show, :update,:index]
  end

  resources :users, only: :show do
    resources :notifications, only: :index
      # collection do
      #   post: mark_as_read
      # end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
