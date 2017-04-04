class Page < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments
  has_many :parts
  has_many :tags, through: :parts
  validates :title, :content, presence: true
  self.per_page = 4
end
