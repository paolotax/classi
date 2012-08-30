class CreateClassi < ActiveRecord::Migration
  def change
    create_table :classi do |t|
      t.integer :cliente_id
      t.integer :classe
      t.string :sezione
      t.integer :nr_alunni

      t.timestamps
    end
  end
end
