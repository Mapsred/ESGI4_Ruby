class RemoveExpeditionAstronaut < ActiveRecord::Migration[5.2]
  def change
    remove_index :expeditions, :astronaut_id
    remove_column :expeditions, :astronaut_id
  end
end
