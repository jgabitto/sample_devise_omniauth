Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'api/omniauth_callbacks' }, defaults: { format: :json }
  
  namespace :api do
    get 'auth/:provider/callback', to: 'omniauth_callbacks#github'
    post 'auth/:provider/callback', to: 'omniauth_callbacks#github'
  end
  # root to: 'home#index'
end
