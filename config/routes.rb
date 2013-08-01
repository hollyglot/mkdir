Mksdir::Application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/rails_admin', :as => 'rails_admin'

  resources :students


  authenticated :user do
    root :to => 'students#index'
  end
  root :to => "directory#index"
  match 'search' => "students#search"

  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_for :users, :controllers => { :sessions => "sessions" }


end