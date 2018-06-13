class Expedition < ApplicationRecord
  belongs_to :planet
  has_many :expedition_astronauts
  has_many :astronauts, through: :expedition_astronauts

end
