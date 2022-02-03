class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_secure_password # check if the password confirmation matches the password
end
