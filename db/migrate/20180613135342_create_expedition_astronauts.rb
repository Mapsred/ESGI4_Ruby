class CreateExpeditionAstronauts < ActiveRecord::Migration[5.2]
  def change
    create_table :expedition_astronauts do |t|
      t.references :expedition, foreign_key: true
      t.references :astronaut, foreign_key: true

      t.timestamps
    end
  end
end
