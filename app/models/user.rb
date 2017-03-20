class User < ApplicationRecord
  has_secure_password
  has_many :pages
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true

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
