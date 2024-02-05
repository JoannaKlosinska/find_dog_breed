class AddImageUrlToDogBreeds < ActiveRecord::Migration[6.1]
  def change
    add_column :dog_breeds, :dog_breed_image_url, :string
  end
end
