class Part < ApplicationRecord
  belongs_to :page
  belongs_to :tag
end
