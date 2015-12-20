TestMongoId::Application.routes.draw do
  
  mount Attachinary::Engine => "/attachinary"
  devise_for :users

  get "last", to: "messages#last"
  
  resources :messages, :only => [:create]
  
  namespace :admin do
    resources :messages
  end

  root to: "static_pages#home"

end
