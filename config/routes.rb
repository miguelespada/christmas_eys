TestMongoId::Application.routes.draw do
  
  mount Attachinary::Engine => "/attachinary"
  devise_for :users

  get "last", to: "messages#last"
  get "stream", to: "static_pages#stream"
  resources :messages, :only => [:create]
  
  namespace :admin do
    resources :messages
  end

  root to: "static_pages#home"

end
