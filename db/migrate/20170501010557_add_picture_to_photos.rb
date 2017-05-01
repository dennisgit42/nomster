class AddPictureToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :Picture, :string
  end
end
