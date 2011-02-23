Dummy::Application.routes.draw do
  resources :eggs
  root :to => "eggs#index"
end