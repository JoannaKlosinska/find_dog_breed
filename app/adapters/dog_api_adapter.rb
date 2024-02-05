require_relative '../errors/dog_breed_not_found_error'

class DogApiAdapter

  include HTTParty
  base_uri 'https://dog.ceo/api'

  def self.find_breed_image(breed_name)
    response = get("/breed/#{breed_name}/images/random")
    handle_response(response)
  end

  def self.find_sub_breed_image(name)
    sub_breed_name, breed_name = name.split(' ')
    response = get("/breed/#{breed_name}/#{sub_breed_name}/images/random")
    handle_response(response)
  end

  def self.handle_response(response)
    raise Errors::DogBreedNotFoundError unless response['status'] == 'success'

    response['message']
  end
end
