class Room < ApplicationRecord
  validates_uniqueness_of :name

  has_many :messages
end
