Rails.application.routes.draw do
  resources :libraries do
    resources :library_books, only: [:create, :destroy]
  end

  resources :books
 
end
