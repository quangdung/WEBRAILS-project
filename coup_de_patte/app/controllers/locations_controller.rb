# encoding: utf-8
class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]


  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    authorize! :create, Location, :message => "Vous n'avez pas l'autorisation"

    @location = Location.new

    @location.status_location = StatusLocation.find_by_nom("En attente")
    @location.animal = Animal.find(params[:animal_id])
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
    @animals = Animal.all
    @statusLocations = StatusLocation.all

    authorize! :update, @location, :message => "Vous n'avez pas l'autorisation"
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    authorize! :create, @location, :message => "Vous n'avez pas l'autorisation"

    if(!(@location.animal.status_animal.nom == "disponible"))
      flash[:error] =  'L\'animal n\'est pas disponible actuellement'
      redirect_to new_location_path(animal_id: @location.animal_id)
      return
    end

    for location in @location.animal.locations
      if(!(location.status_location == "Annulé"))
        if(!((location.date + location.dureeJour <= @location.date) || (@location.date + @location.dureeJour <= location.date)))
          flash[:error] =  'Conflit avec une autre location'
          redirect_to new_location_path(animal_id: @location.animal_id)
          return
        end
      end
    end

    @location.user_id = current_user.id
    #location status is "en attente"
    @location.status_location_id = 1

    #updating TypeTaches
    if params[:location][:type_taches]
      for id_type_tache in params[:location][:type_taches]
        aType = TypeTache.find(id_type_tache)
        if (!(@location.animal.type_tache.include?(aType)))
          flash[:error] =  'Cet animal ne peut pas faire ces tâches'
          redirect_to new_location_path(animal_id: @location.animal_id)
          return
        end
        @location.type_tache << aType
      end
    end


    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new, animal_id: @location.animal_id}
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    authorize! :update, @location, :message => "Vous n'avez pas l'autorisation"

    if(!(@location.animal.status_animal.nom == "disponible"))
      flash[:error] =  'L\'animal n\'est pas disponible actuellement'
      redirect_to edit_location_path(animal_id: @location.animal_id)
      return
    end

    for location in @location.animal.locations
      if(!(location.status_location == "Annulé"))
        if(!((location.date + location.dureeJour <= @location.date) || (@location.date + @location.dureeJour <= location.date)))
          flash[:error] =  'Conflit avec une autre location'
          redirect_to edit_location_path(animal_id: @location.animal_id)
          return
        end
      end
    end

    # updating TypeTaches
    @location.type_tache.each do |aType|
      @location.type_tache.delete(aType)
    end

    if params[:location][:type_taches]
      for id_type_tache in params[:location][:type_taches]
        aType = TypeTache.find(id_type_tache)
        if (!(@location.animal.type_tache.include?(aType)))
          flash[:error] =  'Cet animal ne peut pas faire ces tâches'
          redirect_to edit_location_path(animal_id: @location.animal_id)
          return
        end
        @location.type_tache << aType
      end
    end
    # end updating TypeTaches

    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    authorize! :delete, @location, :message => "Vous n'avez pas l'autorisation"

    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:date, :dureeJour, :animal_id, :user_id, :status_location_id)
    end
end
