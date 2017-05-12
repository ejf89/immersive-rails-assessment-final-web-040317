class Appearance < ApplicationRecord
  validates :rating, numericality: { less_than_or_equal_to: 5,  only_integer: true }

  belongs_to :guest
  belongs_to :episode
  belongs_to :user


end
