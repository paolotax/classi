class CreateAdozioni < ActiveRecord::Migration
  def change
    create_table :adozioni do |t|
      t.integer :classe_id
      t.integer :libro_id
      t.integer :nr_copie

      t.timestamps
    end
  end
end
