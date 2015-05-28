class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy, :remove_from_farm]

  # GET /animals
  # GET /animals.json
  def index
    @animals = Animal.all
  end

  # GET /animals/1
  # GET /animals/1.json
  def show
  end

  # GET /animals/new
  def new
    @animal = Animal.new
    authorize! :create, Animal, :message => "Vous n'avez pas l'autorisation"
    @especes = Espece.all
    @status_animals = StatusAnimal.all
    @fermes = Ferme.where(user_id: current_user.id)
    #render :partial => "animals/form", :locals => {:isRemote => true}
  end

  # GET /animals/1/edit
  def edit
    @animal = Animal.find(params[:id])
    authorize! :update, Animal, :message => "Vous n'avez pas l'autorisation"
    @especes = Espece.all
    @status_animals = StatusAnimal.all
    @fermes = Ferme.where(user_id: current_user.id)
  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = Animal.new(animal_params)
    @animal.user_id = current_user.id
    authorize! :create, @animal, :message => "Vous n'avez pas l'autorisation"
    if !@animal.ferme.nil?
      authorize! :manage, @animal.ferme, :message => "Vous n'avez pas l'autorisation"
    end

    #updating TypeTaches
    if params[:animal][:type_taches]
      for id_type_tache in params[:animal][:type_taches]
        aType = TypeTache.find(id_type_tache)
        @animal.type_tache << aType
      end
    end

    respond_to do |format|
      if @animal.save
        format.html { redirect_to @animal, notice: 'Animal was successfully created.' }
        format.json { render :show, status: :created, location: @animal }
        format.js { render 'fermes/ajoutAnimal' }
      else
        @especes = Espece.all
        @status_animals = StatusAnimal.all
        @fermes = Ferme.where(user_id: current_user.id)
        format.html { render :new }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    authorize! :update, @animal, :message => "Vous n'avez pas l'autorisation"
    if !@animal.ferme.nil?
      authorize! :manage, @animal.ferme, :message => "Vous n'avez pas l'autorisation"
    end

    #updating TypeTaches
    @animal.type_tache.each do |aType|
      @animal.type_tache.delete(aType)
    end
    if params[:animal][:type_taches]
      for id_type_tache in params[:animal][:type_taches]
        aType = TypeTache.find(id_type_tache)
        @animal.type_tache << aType
      end
    end

    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to @animal, notice: 'Animal was successfully updated.' }
        format.json { render :show, status: :ok, location: @animal }
      else
        @especes = Espece.all
        @status_animals = StatusAnimal.all
        @fermes = Ferme.where(user_id: current_user.id)
        format.html { render :edit }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT animals/1/remove_from_farm
  def remove_from_farm
    authorize! :update, @animal, :message => "Vous n'avez pas l'autorisation"
    @animal.update(ferme_id: nil)
    format.js { render :nothing => true }
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    authorize! :delete, @animal, :message => "Vous n'avez pas l'autorisation"
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to animals_url, notice: 'Animal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_params
      params.require(:animal).permit(:nom, :status_animal_id, :prix_journalier, :ferme_id, :espece_id)
    end
end
