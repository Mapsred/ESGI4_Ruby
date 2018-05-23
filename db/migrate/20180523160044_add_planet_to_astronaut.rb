class AddPlanetToAstronaut < ActiveRecord::Migration[5.2]
  def change
    add_column :astronauts, :planet_id, :integer
    add_index  :astronauts, :planet_id

  end
end
