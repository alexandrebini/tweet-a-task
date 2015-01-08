Rails.application.routes.draw do
  namespace :api, constraints: { format: 'json' } do
    resources :phrases, only: [:index, :show, :create]
    resources :managers, only: [:index]
    resources :tasks, only: [:index]
  end

  root 'application#index'
  get '(*params)', to: 'application#index'
end