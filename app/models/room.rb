class Room < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name

  has_many :messages
end
