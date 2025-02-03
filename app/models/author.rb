class Author < ApplicationRecord
    has_many :books, dependent: :destroy

    validates :first_name, presence: true, length: {maximum: 100}, format: {with: /\A[\p{L}\s'-]+\z/, message: "Only allows letters, spaces, hyphens"}
    validates :last_name, presence: true, uniqueness: {scope: :first_name, case_sensitive: false}, length: {maximum: 100},  format: {with: /\A[\p{L}\s'-]+\z/, message: "Only allows letters, spaces, hyphens"}
    validates :bio, length: {maximum: 500}

    def full_name
        "#{first_name} #{last_name}"
    end
end
