class Category < ApplicationRecord
    has_many :books, dependent: :destroy

    validates :name, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false}
    validates :description, length: {maximum: 100}

    validates :name, format: { with: /\A[\p{L}\s'-]+\z/, message: "only allows letters, numbers, spaces, hyphens, and apostrophes" }

end
