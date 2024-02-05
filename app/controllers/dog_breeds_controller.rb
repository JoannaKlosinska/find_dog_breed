class DogBreedsController < ApplicationController

  def index
    @name = params[:breed]
    if @name.present?
      redirect_to dog_breed_path(@name)
    end
  end

  def show
    @name = params[:breed]
    dog_breed = FetchDogBreed.new(@name).call
    if dog_breed.nil?
      respond_to do |format|
        flash[:alert] = "Breed not found, please try again"
        format.html { redirect_to root_path }
      end
    else
      @image_url = dog_breed.image_url
    end
  end

end

