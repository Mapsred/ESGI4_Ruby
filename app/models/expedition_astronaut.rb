# frozen_string_literal: true

# ExpeditionAstronaut
class ExpeditionAstronaut < ApplicationRecord
  belongs_to :expedition
  belongs_to :astronaut
end
