require_relative '../errors/dog_breed_not_found_error'

class FetchDogBreed

  def initialize(name)
    @name = name
  end

  def call
    DogApiAdapter.find(name)
  rescue Errors::DogBreedNotFoundError => e
    Rails.logger.warn(e.message)
    nil
  end

  private

  attr_reader :name

end
