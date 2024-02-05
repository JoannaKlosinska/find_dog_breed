class DogBreedsController < ApplicationController

  def index
    @name = params[:breed]
    if @name.present?
      redirect_to dog_breed_path(@name)
    end
  end

  def show
    @name = params[:breed]
    @image_url = FetchDogBreed.new(@name).call
    if @image_url.nil?
      respond_to do |format|
        flash[:alert] = "Breed not found, please try again"
        format.html { redirect_to root_path }
      end
    else
      @image_url
    end
  end

end

