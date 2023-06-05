class Review < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :commments

 def self.looks(search, word)
    if search == "perfect_match"
      @review = Review.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @review = Review.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @review = Review.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @review = Review.where("title LIKE?","%#{word}%")
    else
      @review = Review.all
    end
 end
end
