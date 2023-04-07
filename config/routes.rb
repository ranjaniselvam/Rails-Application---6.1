Rails.application.routes.draw do
  resources :topics
  root "articles#index"
  get 'articles/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
