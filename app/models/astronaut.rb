# frozen_string_literal: true

class Astronaut < ApplicationRecord
  belongs_to :grade
  belongs_to :planet

end
