class Tag < ApplicationRecord
  has_many :parts
  has_many :pages, through: :parts
end
