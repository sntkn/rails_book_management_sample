Rails.application.routes.draw do
  resources :my_pages, only: :index
  resources :user_books, only: [:create, :destroy]
  resources :books, except: :destroy
  devise_for :users, except: :destroy
  root to: 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
