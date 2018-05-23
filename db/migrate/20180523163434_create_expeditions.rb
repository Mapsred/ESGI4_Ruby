class CreateExpeditions < ActiveRecord::Migration[5.2]
  def change
    create_table :expeditions do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps
    end

    add_column :expeditions, :astronaut_id, :integer
    add_index  :expeditions, :astronaut_id
    add_column :expeditions, :planet_id, :integer
    add_index  :expeditions, :planet_id
  end
end
