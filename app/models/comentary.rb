class Comentary < ApplicationRecord
  belongs_to :user
  belongs_to :photos
  
end
