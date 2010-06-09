Phodown::Application.routes.draw do |map|
  get "rating/rate"

  resources :entries do
    resources :comments
  end

  resources :types

  resources :rules

  resources :challenges do
    resources :entries, :except => [:edit, :destroy] do
      get :rate, :on => :member
    end
  end

  devise_for :users

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "base#index"
end
