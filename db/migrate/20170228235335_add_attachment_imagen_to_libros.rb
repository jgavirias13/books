class AddAttachmentImagenToLibros < ActiveRecord::Migration
  def self.up
    change_table :libros do |t|
      t.attachment :imagen
    end
  end

  def self.down
    remove_attachment :libros, :imagen
  end
end
