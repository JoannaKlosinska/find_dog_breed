module Errors
  class DogBreedNotFoundError < StandardError

    def initialize(name)
      @name = name
    end

    def message
      "#{name} not found!"
    end

    private

    attr_reader :name

  end
end
  