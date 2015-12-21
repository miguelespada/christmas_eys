TestMongoId::Application.routes.draw do
  
  mount Attachinary::Engine => "/attachinary"
  devise_for :users

  get "last", to: "messages#last"
  get "stream", to: "static_pages#stream"
  get "thanks", to: "static_pages#thanks"
  get "plantilla", to: "static_pages#plantilla"
  resources :messages, :only => [:create, :new]
  
  namespace :admin do
    resources :messages do 
      get "favorite"
      get "unfavorite"
    end
  end

  root to: "static_pages#home"

end
