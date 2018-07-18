# frozen_string_literal: true

# Planet
class Planet < ApplicationRecord
  has_many :astronaut
  has_many :expeditions
  has_one_attached :photo
end
