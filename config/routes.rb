Rails.application.routes.draw do
  root to: 'projects#index'

  devise_for :users
  resources :projects do
    resources :collaborations, only: [:new, :create]
    resources :comments, only: [:new, :create]
  end

  resources :users, only: :show

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
