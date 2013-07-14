Mksdir::Application.routes.draw do
  resources :students


  authenticated :user do
    root :to => 'directory#index'
  end
  root :to => "directory#index"
  devise_for :users
  resources :users
end