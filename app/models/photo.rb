class Photo < ApplicationRecord
  belongs_to :user
  has_many :comentaries
  has_one_attached :image
end
