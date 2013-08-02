Mksdir::Application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/rails_admin', :as => 'rails_admin'

  resources :students


  authenticated :user do
    root :to => 'students#index'
  end
  root :to => "directory#index"
  match 'search_location' => "students#search_location"
  match 'search_name' => "students#search_name"

  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_for :users, :controllers => { :sessions => "sessions" }


end