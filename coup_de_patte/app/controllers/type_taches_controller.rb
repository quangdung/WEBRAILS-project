class TypeTachesController < ApplicationController
  before_action :set_type_tach, only: [:show, :edit, :update, :destroy]

  # GET /type_taches
  # GET /type_taches.json
  def index
    @type_taches = TypeTache.all
  end

  # GET /type_taches/1
  # GET /type_taches/1.json
  def show
  end

  # GET /type_taches/new
  def new
    @type_tach = TypeTache.new
    authorize! :create, @type_tach, :message => "Vous n'avez pas l'autorisation"
  end

  # GET /type_taches/1/edit
  def edit
    @type_tach = TypeTache.find(params[:id])
    authorize! :update, @espece, :message => "Vous n'avez pas l'autorisation"
  end

  # POST /type_taches
  # POST /type_taches.json
  def create
    @type_tach = TypeTache.new(type_tach_params)
    authorize! :create, @espece, :message => "Vous n'avez pas l'autorisation"

    respond_to do |format|
      if @type_tach.save
        format.html { redirect_to @type_tach, notice: 'Type tache was successfully created.' }
        format.json { render :show, status: :created, location: @type_tach }
      else
        format.html { render :new }
        format.json { render json: @type_tach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_taches/1
  # PATCH/PUT /type_taches/1.json
  def update
    authorize! :update, @type_tach, :message => "Vous n'avez pas l'autorisation"
    respond_to do |format|
      if @type_tach.update(type_tach_params)
        format.html { redirect_to @type_tach, notice: 'Type tache was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_tach }
      else
        format.html { render :edit }
        format.json { render json: @type_tach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_taches/1
  # DELETE /type_taches/1.json
  def destroy
    authorize! :delete, @type_tach, :message => "Vous n'avez pas l'autorisation"
    @type_tach.destroy
    respond_to do |format|
      format.html { redirect_to type_taches_url, notice: 'Type tache was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_tach
      @type_tach = TypeTache.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_tach_params
      params.require(:type_tach).permit(:nom)
    end
end
