class Report < ApplicationRecord
  belongs_to :astronaut, optional: true
end
