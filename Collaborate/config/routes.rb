# Created 7/18/2020 by Duytan Tran
# Edited 7/22/2020 by Duytan Tran: routing for professor pages
# Edited 7/23/2020 by Duytan Tran: added routing for destroying professor courses
# Edited 7/24/2020 by Duytan Tran: Reimplemented professor routes into courses
# Edited 7/25/2020 by Duytan Tran: added enrolled in and projects routes
# Edited 7/26/2020 by Duytan Tran: removed resources :accounts to fix tool bar
# Routes for Collaborate peer evaluation application
Rails.application.routes.draw do
  # Courses page routes
  resources :courses

  # Enrolled page routes
  resources :enrolled_ins, except: [:show]
  get 'enrolled_ins/:id', to: 'courses#view_enrolled'
  post 'enrolled_ins/:id', to: 'enrolled_ins#enroll_student'

  # Projects page routes
  resources :projects, except: [:show]
  get 'projects/:id', to: 'courses#view_projects'

  # Home page routes
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