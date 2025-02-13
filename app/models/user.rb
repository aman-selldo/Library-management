class User < ApplicationRecord
  has_secure_password

  belongs_to :library, optional: true

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :library_id, presence: true, if: -> { role == "admin" }


  def admin?
    role == "admin"
  end

  def super_admin?
    role == "super_admin"
  end

  def user
    role == "user"
  end
end
