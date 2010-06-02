Phodown::Application.routes.draw do |map|
  resources :types

  resources :rules

  resources :challenges

  devise_for :users

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "base#index"
end
