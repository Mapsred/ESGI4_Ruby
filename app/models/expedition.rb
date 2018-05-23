class Expedition < ApplicationRecord
  belongs_to :astronaut
  belongs_to :planet

end
