# Created 7/18/2020 by Duytan Tran
# Edited 7/22/2020 by Duytan Tran: routing for professor pages
# Edited 7/23/2020 by Duytan Tran: added routing for destroying professor courses
# Routes for Collaborate peer evaluation application
Rails.application.routes.draw do
  # Professor Page Routes
  resources :courses

  # Home page routes
  resources :accounts
  devise_for :accounts

  devise_scope :account do
    authenticated :account do
      root 'pages#home', as: :authenticated_root
      end

      unauthenticated do
        root 'devise/sessions#new', as: :unauthenticated_root
      end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end