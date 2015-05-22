class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]

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
  end

  # GET /animals/1/edit
  def edit
    @animal = Animal.find(params[:id])
    authorize! :update, Animal, :message => "Vous n'avez pas l'autorisation"
  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = Animal.new(animal_params)
    authorize! :create, @animal, :message => "Vous n'avez pas l'autorisation"

    respond_to do |format|
      if @animal.save
        format.html { redirect_to @animal, notice: 'Animal was successfully created.' }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    authorize! :update, @animal, :message => "Vous n'avez pas l'autorisation"
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to @animal, notice: 'Animal was successfully updated.' }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
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
      params.require(:animal).permit(:nom, :status_id, :prix_journalier, :ferme_id, :espece_id)
    end
end
