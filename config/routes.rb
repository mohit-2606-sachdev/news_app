Rails.application.routes.draw do
  root to: "article#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users ,controllers: { registrations: 'users/registrations' }
  resources :article
end
