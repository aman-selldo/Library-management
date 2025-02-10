class Library < ApplicationRecord
    has_many :library_books
    has_many :books, through: :library_books
    
    validates :name, presence: true, length: {maximum: 100}, uniqueness: {scope: :location, message: "Library name should be unique within a location."}
    validates :location, presence: true, length: {maximum: 200}
    validates :capacity, presence: true, numericality: {only_integer: true}
end