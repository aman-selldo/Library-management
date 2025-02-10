Rails.application.routes.draw do
  resources :libraries do
    resources :library_books, only: [:create, :destroy, :index, :new]
  end

  resources :books
 
end
