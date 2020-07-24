# Created 7/18/2020 by Duytan Tran
# Edited 7/22/2020 by Duytan Tran: routing for professor pages
# Edited 7/23/2020 by Duytan Tran: added routing for destroying professor courses
# Routes for Collaborate peer evaluation application
Rails.application.routes.draw do
  # Professor Page Routes
  resources :courses
  resources :taught_bies
  get 'professor/index'
  post 'courses/:id', to: 'professor#destroy'
  get 'professor/new'
  post 'professor/create'

  # Home page routes
  root to: 'pages#home'
  devise_for :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end