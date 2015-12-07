TestMongoId::Application.routes.draw do

  get "last", to: "messages#last"
  resources :messages
  
  root to: "static_pages#home"

end
