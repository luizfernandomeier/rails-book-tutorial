class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_secure_password # check if the password confirmation matches the password
  after_destroy :ensure_an_admin_remains # transaction hook - we can create a stack of hooks

  class Error < StandardError # this class exists so we can catch it explicitly on the controller
  end

  private

  def ensure_an_admin_remains
    # this will make the transaction fail
    raise Error, "Can't delete last user" if User.count.zero?
    # we could raise an ActiveRecord::Rollback exception if we didn't want the exception to be passed on
  end
end
