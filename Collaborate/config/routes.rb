# Created 7/18/2020 by Duytan Tran
# Edited 7/22/2020 by Duytan Tran: routing for professor pages
# Routes for Collaborate peer evaluation application
Rails.application.routes.draw do
  resources :courses
  get 'professor/index'
  post 'professor/create'
  get 'professor/new'
  get 'professor/edit'
  get 'professor/destroy'
  get 'professor/projects'
  get 'professor/groups'
  root to: 'pages#home'
  devise_for :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
