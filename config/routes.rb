Rails.application.routes.draw do
  get 'my_pages/index'
  resources :user_books, only: [:create, :destroy]
  resources :books
  devise_for :users
  root to: 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
