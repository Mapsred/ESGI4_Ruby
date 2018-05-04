# frozen_string_literal: true

class Astronaut < ApplicationRecord
  attr_accessible :id, :name, :mail, :grade

  belongs_to :grade

end
