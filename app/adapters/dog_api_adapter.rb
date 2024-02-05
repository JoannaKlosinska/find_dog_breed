require_relative '../errors/dog_breed_not_found_error'

class DogApiAdapter

  include HTTParty
  base_uri 'https://dog.ceo/api'
  
  def self.find(name)
    response = get("/breed/#{name.downcase}/images")
    images = response['message']

    raise Errors::DogBreedNotFoundError, name unless response['status'] == 'success'

    random_image = images.sample
    random_image
  end  
end
