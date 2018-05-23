# frozen_string_literal: true

# Planet Model
class Planet < ApplicationRecord
  has_many :astronaut
  has_many :expeditions

end
