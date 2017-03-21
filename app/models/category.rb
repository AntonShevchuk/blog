class Category < ApplicationRecord
  has_many :pages
  validates :name, presence: true, uniqueness: true
end
