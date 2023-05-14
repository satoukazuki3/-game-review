class Review < ApplicationRecord
  belongs_to :genre
  has_many :users
  has_many :commment

end
