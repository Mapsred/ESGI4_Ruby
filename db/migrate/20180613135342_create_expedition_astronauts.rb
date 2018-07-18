class CreateExpeditionAstronauts < ActiveRecord::Migration[5.2]
  def change
    create_table :expedition_astronauts do |t|
      t.references :expedition, foreign_key: {on_delete: :cascade}
      t.references :astronaut, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
