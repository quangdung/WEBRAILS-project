class EspecesController < ApplicationController
  before_action :set_espece, only: [:show, :edit, :update, :destroy]

  # GET /especes
  # GET /especes.json
  def index
    @especes = Espece.all
  end

  # GET /especes/1
  # GET /especes/1.json
  def show
  end

  # GET /especes/new
  def new
    @espece = Espece.new
  end

  # GET /especes/1/edit
  def edit
  end

  # POST /especes
  # POST /especes.json
  def create
    @espece = Espece.new(espece_params)

    respond_to do |format|
      if @espece.save
        format.html { redirect_to @espece, notice: 'Espece was successfully created.' }
        format.json { render :show, status: :created, location: @espece }
      else
        format.html { render :new }
        format.json { render json: @espece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /especes/1
  # PATCH/PUT /especes/1.json
  def update
    respond_to do |format|
      if @espece.update(espece_params)
        format.html { redirect_to @espece, notice: 'Espece was successfully updated.' }
        format.json { render :show, status: :ok, location: @espece }
      else
        format.html { render :edit }
        format.json { render json: @espece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /especes/1
  # DELETE /especes/1.json
  def destroy
    @espece.destroy
    respond_to do |format|
      format.html { redirect_to especes_url, notice: 'Espece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_espece
      @espece = Espece.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def espece_params
      params.require(:espece).permit(:nom)
    end
end
