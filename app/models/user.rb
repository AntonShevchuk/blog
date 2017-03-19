class User < ApplicationRecord
  has_secure_password
  has_many :pages

  def name
    return "#{first_name} #{last_name}"
  end
end
