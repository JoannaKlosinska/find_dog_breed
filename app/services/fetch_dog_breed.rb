require_relative '../errors/dog_breed_not_found_error'

class FetchDogBreed

  def initialize(name)
    @name = name
  end

  def call
    image_url = DogApiAdapter.find(name)
    DogBreed.create(name: name, image_url: image_url)
  rescue Errors::DogBreedNotFoundError => e
    Rails.logger.warn(e.message)
    nil
  end

  private

  attr_reader :name

end
