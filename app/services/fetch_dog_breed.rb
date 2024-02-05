require_relative '../errors/dog_breed_not_found_error'

class FetchDogBreed

  def initialize(name)
    @name = name.downcase
  end

  def call
    if sub_breed?
      fetch_sub_breed_image
    else
      fetch_breed_image
    end
  rescue Errors::DogBreedNotFoundError => e
    Rails.logger.warn(e.message)
    nil
  end

  private

  attr_reader :name

  def fetch_breed_image
    DogApiAdapter.find_breed_image(name)
  end

  def fetch_sub_breed_image
    DogApiAdapter.find_sub_breed_image(name)
  end

  def sub_breed?
    name.split(' ').count > 1
  end

end
