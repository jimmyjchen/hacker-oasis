Rails.application.routes.draw do
  root to: 'projects#index'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :projects do
    resources :collaborations, only: [:new, :create, :show, :index]

    resources :comments, only: [:index, :show, :new, :create]
    resources :hacker_days, only: [:new, :create, :show, :update,:destroy, :index]
    resources :likes
    resources :team_comments, only: [:index, :show, :new, :create]

  end

  resources :users, only: :show do
    resources :notifications, only: :index
  end

  post 'users/:user_id/notifications', to: 'notifications#mark_as_read', as: :notifications_mark_as_read


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
