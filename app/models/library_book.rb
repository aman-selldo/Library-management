class LibraryBook < ApplicationRecord
  belongs_to :library
  belongs_to :book
  
  validates :library_id, presence: true 
  validates :book_id, presence: true
end
