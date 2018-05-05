class Grades < ActiveRecord::Migration[5.2]
  def change
    add_column :grades, :alias, :string, after: :name
  end
end
