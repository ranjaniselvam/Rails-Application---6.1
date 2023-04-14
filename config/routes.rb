Rails.application.routes.draw do

  resources :tags
  resources :topics do
    resources :posts do
      resources :comments ,only: [:create,:destroy]
      resources :ratings ,only: [:create]
    end
  end
  root "articles#index"
  get 'articles/index'
  get '/posts' => 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
