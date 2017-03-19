class Page < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :parts
  has_many :tags, through: :parts
end
