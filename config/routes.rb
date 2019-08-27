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


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :projects, only: [ :index, :show, :update, :create, :destory ] do
        resources :hacker_days, only: [ :index, :show, :new, :create, :update, :destroy]
        resources :commentsc, only: [ :index, :show, :new, :create, :update, :destroy]
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
