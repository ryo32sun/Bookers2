Rails.application.routes.draw do
  
  devise_for :users
  get "search_tag" => "books#search_tag"

  get root :to => 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users
  resources :books


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
