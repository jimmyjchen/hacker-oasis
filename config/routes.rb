Rails.application.routes.draw do
  get 'notifications/index'
  root to: 'projects#index'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # devise_scope :user do
  #   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  resources :projects do
    resources :collaborations, only: [:new, :create, :show, :index]
    resources :comments, only: [:new, :create]
  end

  resources :users, only: :show do
    resources :notifications, only: :index
    #   collection do
    #     post: mark_as_read
    #   end
    # end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
