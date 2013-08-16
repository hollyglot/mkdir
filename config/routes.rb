Mkdir::Application.routes.draw do

  resources :staff_members


  resources :hiring_partners


  #This line mounts the routes for rails_admin
  mount RailsAdmin::Engine => '/rails_admin', :as => 'rails_admin'

  resources :mentors
  resources :students
  resources :pages
  resources :directory
  resources :roles

  #Once the user logs in route them to the directory  
  authenticated :user do
    root :to => 'directory#index'
  end

  # Pages index is the home or root page for the application
  root :to => "pages#index"

  #When the search by radius form is submited, it is posted to the search_location action on the directory controller 
  match 'search_location' => "directory#search_location"

  #When the search by name form is submited, it is posted to the search_name action on the directory controller
  match 'search_name' => "directory#search_name"

  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_for :users, :controllers => { :sessions => "sessions" }


end