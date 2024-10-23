class RenamePhotosIdToPhotoIdInComentaries < ActiveRecord::Migration[7.2]
  def change
    rename_column :comentaries, :photos_id, :photo_id
  end
end
