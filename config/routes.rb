Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'api/omniauth_callbacks' }, defaults: { format: :json }
  # root to: 'home#index'
end
