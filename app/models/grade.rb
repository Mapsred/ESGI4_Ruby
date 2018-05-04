# frozen_string_literal: true

# Grade Model
class Grade < ApplicationRecord
  attr_accessible :id, :name, :description, :astronaut

  has_many :astronaut
end
