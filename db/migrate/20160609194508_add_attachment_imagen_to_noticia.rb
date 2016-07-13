class AddAttachmentImagenToNoticia < ActiveRecord::Migration
  def self.up
    change_table :noticia do |t|
      t.attachment :imagen
    end
  end

  def self.down
    remove_attachment :noticia, :imagen
  end
end
