class ChangeColumnNameInDogBreeds < ActiveRecord::Migration[6.1]
  def change
    rename_column :dog_breeds, :dog_breed_image_url, :image_url
  end
end
