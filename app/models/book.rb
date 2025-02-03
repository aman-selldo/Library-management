class Book < ApplicationRecord
    belongs_to :category
    belongs_to :author


    validates :title, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 255}
    validates :category, presence: true
    validates :author, presence: true
    validates :published_year, numericality: {only_integer: true, greater_than_or_equal_to: 1800, less_than_or_equal_to: Date.today.year }
end