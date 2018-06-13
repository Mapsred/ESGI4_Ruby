class Expedition < ApplicationRecord
  belongs_to :planet
  has_many :expedition_astronauts
  has_many :astronauts, through: :expedition_astronauts
  scope :last_opened, -> { where('end_date > ?', DateTime.now).order(created_at: :desc).last }


end
