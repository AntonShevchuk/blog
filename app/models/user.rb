class User < ApplicationRecord
  has_secure_password
  has_many :pages
  has_many :comments
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  self.per_page = 10

  ROLES = ['admin', 'editor']

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
