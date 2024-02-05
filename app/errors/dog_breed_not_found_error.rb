module Errors
  class DogBreedNotFoundError < StandardError

    def message
      "That bread does not exist!"
    end

  end
end
