Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'api/omniauth_callbacks' }
  # root to: 'home#index'
end
