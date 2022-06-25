Rails.application.routes.draw do
  
  devise_for :users
  get "search_book" => "books#search_book"

  get root :to => 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users
  resources :books


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
