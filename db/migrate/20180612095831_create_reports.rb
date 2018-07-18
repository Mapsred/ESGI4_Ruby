class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :name
      t.string :description
      t.references :astronaut, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
