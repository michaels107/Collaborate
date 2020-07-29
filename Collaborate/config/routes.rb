# Created 7/18/2020 by Duytan Tran
# Edited 7/22/2020 by Duytan Tran: routing for professor pages
# Edited 7/23/2020 by Duytan Tran: added routing for destroying professor courses
# Edited 7/24/2020 by Duytan Tran: Reimplemented professor routes into courses
# Edited 7/25/2020 by Duytan Tran: added enrolled in and projects routes
# Edited 7/26/2020 by Duytan Tran: removed forms :accounts to fix tool bar
# Edited 7/27/2020 by Reema Gupta: added routing for group
# Edited 7/29/2020 by Reema Gupta: added routing for group
# Routes for Collaborate peer evaluation apart_ofs and associated
Rails.application.routes.draw do
  # Peer Eval forms page routes
  resources :peer_evaluations, except: [:show]
  get 'peer_evaluations/:id', to: 'peer_evaluations#index'



  # Courses page routes
  resources :courses

  resources :groups, except: [:show]
  get 'groups/:id', to: 'courses#view_groups'

  resources :apart_ofs, except: [:show]
  get 'apart_ofs/:id', to: 'groups#view_students_in_group'
  post 'apart_ofs/:id', to: 'apart_ofs#add_student_to_group'

  resources :associateds, except: [:show]
  get 'associateds/:id', to: 'groups#view_projects_in_group'
  post 'associateds/:id', to: 'associateds#add_project_to_group'

  # Enrolled page routes
  resources :enrolled_ins, except: [:show]
  get 'enrolled_ins/:id', to: 'courses#view_enrolled'
  post 'enrolled_ins/:id', to: 'enrolled_ins#enroll_student'

  # Projects page routes
  resources :projects, except: [:show]
  get 'projects/:id', to: 'courses#view_projects'

  # Home page routes
  resources :accounts, only: [:new]
  post 'accounts/new', to: 'accounts#create'
  devise_for :accounts

  devise_scope :account do
    authenticated :account do
      root 'pages#student_home', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end