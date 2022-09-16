Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :articles do
    resources :comments
  end
  
  root "articles#index"
  # get "articles/new", to: "articles#new"
  # get "/articles/:id", to: "articles#show"
  

  # Defines the root path route ("/")
  # root "articles#index"
end
