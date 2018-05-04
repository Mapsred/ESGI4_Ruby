class AddGradeToAstronaut < ActiveRecord::Migration[5.2]
  def change
    add_column :astronauts, :grade, :integer
    add_index  :astronauts, :grade

  end
end
