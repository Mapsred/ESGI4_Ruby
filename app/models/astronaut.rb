# frozen_string_literal: true

# Astronaut
class Astronaut < ApplicationRecord
  belongs_to :grade
  belongs_to :planet
  has_many :expedition_astronauts
  has_many :expeditions, through: :expedition_astronauts
  has_many :reports
end
