Dummy::Application.routes.draw do
  resources :eggs
  resources :comments
  root :to => "eggs#index"
end