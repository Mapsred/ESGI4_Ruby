class AddGradeToAstronaut < ActiveRecord::Migration[5.2]
  def change
    add_column :astronauts, :grade_id, :integer
    add_index  :astronauts, :grade_id

  end
end
