class User < ApplicationRecord
  has_secure_password
  has_many :pages

  def name
    return "#{first_name} #{last_name}"
  end

  def editor?
    self.role == 'editor'
  end
  
  def admin?
    self.role == 'admin'
  end
end
