Phodown::Application.routes.draw do |map|
  #resources :entries

  resources :types

  resources :rules

  resources :challenges do
    resources :entries, :except => [:edit, :destroy]  
  end

  devise_for :users

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "base#index"
end
