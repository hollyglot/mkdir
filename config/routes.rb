Mksdir::Application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/rails_admin', :as => 'rails_admin'

  resources :students


  authenticated :user do
    root :to => 'directory#index'
  end
  root :to => "directory#index"

  devise_for :users, :controllers => { :registrations => "registrations" }

end