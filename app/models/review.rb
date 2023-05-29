class Review < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :commments

end
