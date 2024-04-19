class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true
end
