Rails.application.routes.draw do
  root to: 'admins#index'

  namespace :admins do
    get 'new_user', action: "new"
    get 'edit_user', action: "edit"
    post 'create_user', action: "create"
    post 'update_user', action: "update"
    delete 'remove_user', action: "destroy"
  end
  resources :admins, only: [:index]

  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
end
