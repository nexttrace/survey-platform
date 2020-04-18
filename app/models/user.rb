class User < ApplicationRecord
  validates :email, uniqueness: { case_sensitive: false }
  validates :phone, uniqueness: { case_sensitive: false }

  passwordless_with :email
end
