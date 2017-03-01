class CreateLibros < ActiveRecord::Migration[5.0]
  def change
    create_table :libros do |t|
      t.string :titulo
      t.string :autor
      t.text :descripcion
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
