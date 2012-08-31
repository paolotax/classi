class CreateLibri < ActiveRecord::Migration
  def change
    create_table :libri do |t|
      t.string :titolo

      t.timestamps
    end
  end
end
