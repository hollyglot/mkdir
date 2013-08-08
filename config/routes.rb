Mksdir::Application.routes.draw do
  mount RailsAdmin::Engine => '/rails_admin', :as => 'rails_admin'

  resources :students
  resources :pages


  authenticated :user do
    root :to => 'directory#index'
  end
  root :to => "pages#index"
  match 'search_location' => "students#search_location"
  match 'search_name' => "students#search_name"

  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_for :users, :controllers => { :sessions => "sessions" }


end