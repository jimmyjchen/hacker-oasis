Rails.application.routes.draw do
  root to: 'projects#index'

  devise_for :users
  resources :projects do
    resources :collaborations, only: [:new, :create, :show, :index]

    resources :comments, only: [:index, :show, :new, :create]
    resources :hacker_days, only: [:new, :create, :show, :update,:index]
  end

  resources :users, only: :show

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
