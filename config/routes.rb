Rails.application.routes.draw do

  root to: "books#index"  
  resources :libraries do
    resources :library_books, only: [:create, :destroy, :index, :new]
  end

  resources :books
end
