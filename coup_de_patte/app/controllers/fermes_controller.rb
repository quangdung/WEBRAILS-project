class FermesController < ApplicationController
  before_action :set_ferme, only: [:show, :edit, :update, :destroy]

  # GET /fermes
  # GET /fermes.json
  def index
    @fermes = Ferme.all
  end

  # GET /fermes/1
  # GET /fermes/1.json
  def show
    @animal = Animal.new
    @animal.ferme_id = params[:id]
    @especes = Espece.all
    @status_animals = StatusAnimal.all
    @fermes = Ferme.where(user_id: current_user.id)
  end

  # GET /fermes/new
  def new
    @ferme = Ferme.new
    authorize! :create, Ferme, :message => "Vous n'avez pas l'autorisation"
    @animals = Animal.where(user_id: current_user.id)
  end

  # GET /fermes/1/edit
  def edit
    @ferme = Ferme.find(params[:id])
    authorize! :update, @ferme, :message => "Vous n'avez pas l'autorisation"
    @animals = Animal.where(user_id: current_user.id)
  end

  # POST /fermes
  # POST /fermes.json
  def create
    @ferme = Ferme.new(ferme_params)
    @ferme.user_id = current_user.id
    authorize! :create, @ferme, :message => "Vous n'avez pas l'autorisation"

    #updating Animals
    if params[:ferme][:animals]
      for id_animal in params[:ferme][:animals]
        aAnimal = Animal.find(id_animal)
        @ferme.animals << aAnimal
      end
    end

    respond_to do |format|
      if @ferme.save
        format.html { redirect_to @ferme, notice: 'Ferme was successfully created.' }
        format.json { render :show, status: :created, location: @ferme }
      else
        @animals = Animal.where(user_id: current_user.id)
        format.html { render :new }
        format.json { render json: @ferme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fermes/1
  # PATCH/PUT /fermes/1.json
  def update
    authorize! :update, @ferme, :message => "Vous n'avez pas l'autorisation"

    #updating Animals
    @ferme.animals.each do |aAnimal|
      @ferme.animals.delete(aAnimal)
    end
    if params[:ferme][:animals]
      for id_animal in params[:ferme][:animals]
        aAnimal = Animal.find(id_animal)
        @ferme.animals << aAnimal
      end
    end

    respond_to do |format|
      if @ferme.update(ferme_params)
        format.html { redirect_to @ferme, notice: 'Ferme was successfully updated.' }
        format.json { render :show, status: :ok, location: @ferme }
      else
        @animals = Animal.where(user_id: current_user.id)
        format.html { render :edit }
        format.json { render json: @ferme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fermes/1
  # DELETE /fermes/1.json
  def destroy
    authorize! :delete, @ferme, :message => "Vous n'avez pas l'autorisation"
    @ferme.destroy
    respond_to do |format|
      format.html { redirect_to fermes_url, notice: 'Ferme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ferme
      @ferme = Ferme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ferme_params
      params.require(:ferme).permit(:nom, :adresse, :gerant_id)
    end
end
