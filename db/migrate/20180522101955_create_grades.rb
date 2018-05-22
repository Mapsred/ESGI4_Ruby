class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.string :name
      t.string :description
      t.string :alias
      t.timestamps
    end
  end
end
