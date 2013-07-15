Mksdir::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :students


  authenticated :user do
    root :to => 'directory#index'
  end
  root :to => "directory#index"
  devise_for :users 
  # , :controllers => { :registrations => "registrations" }
end