require_relative '../errors/dog_breed_not_found_error'

class DogApiAdapter

  include HTTParty
  base_uri 'https://dog.ceo/api'

  # Need to re-think this solution, as probably too much is happening in this adapter
  
  def self.find(name)
    words = name.downcase.split(' ')
    if words.count > 1
      response = response_for_sub_breeds(words)
    else
      response = response_for_breeds(words)
    end

    images = response['message']

    raise Errors::DogBreedNotFoundError, name unless response['status'] == 'success'

    random_image = images.sample
    random_image
  end

  private

  def self.response_for_breeds(words)
    breed_name = words[0]
    get("/breed/#{breed_name}/images")
  end

  def self.response_for_sub_breeds(words)
    breed_name = words[1]
    sub_breed_name = words[0]
    get("/breed/#{breed_name}/#{sub_breed_name}/images")
  end
end
