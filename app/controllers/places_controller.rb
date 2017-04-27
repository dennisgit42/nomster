class PlacesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.all.order(id: :asc).paginate(page: params[:page], per_page: 5)
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render file: Rails.root.join("public", "access_denied.html.erb"), status: :forbidden, layout: false
      #text: "You are not the user who created this place. Only user that created the place can make changes.", status: :forbidden)
    end
  end

  def update
    @place = Place.find(params[:id])
    # if @place.user != current_user
      #return render text: "Not allowed", status: :forbidden
      #return render file: Rails.root.join("public", "access_denied.html.erb"), status: :forbidden, layout: false 
      #text: "You are not the user who created this place. Only user that created the place can make changes.", status: :forbidden)
    #end
    if @place.valid?
      @place.update_attributes(place_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render file: Rails.root.join("public", "access_denied.html.erb"), status: :forbidden, layout: false
      #text: "You are not the user who created this place. Only user that created the place can make changes.", status: :forbidden)
    end
    @place.destroy
    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end
   
end
