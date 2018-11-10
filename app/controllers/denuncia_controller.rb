class DenunciaController < ApplicationController
  #before_action :authenticate_usuario!, except: [:new, :create]
  before_action :set_denuncium, only: [:show, :edit, :update, :destroy]

  # GET /denuncia
  # GET /denuncia.json
  def index
    @denuncia = Denuncium.all
  end

  # GET /denuncia/1
  # GET /denuncia/1.json
  def show
  end

  # GET /denuncia/new
  def new
    combos()
    @denuncium = Denuncium.new
  end

  # GET /denuncia/1/edit
  def edit
    combos()
  end

  # POST /denuncia
  # POST /denuncia.json
  def create
    combos()
    @denuncium = Denuncium.new(denuncium_params)

    respond_to do |format|
      if @denuncium.save
        format.html { redirect_to denuncia_url, notice: 'Denuncia se ha creado exitosamente.' }
        format.json { render :show, status: :created, location: @denuncium }
      else
        format.html { render :new }
        format.json { render json: @denuncium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /denuncia/1
  # PATCH/PUT /denuncia/1.json
  def update
    combos()
    respond_to do |format|
      if @denuncium.update(denuncium_params)
        format.html { redirect_to denuncia_url, notice: 'Denuncia se ha actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @denuncium }
      else
        format.html { render :edit }
        format.json { render json: @denuncium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /denuncia/1
  # DELETE /denuncia/1.json
  def destroy
    @denuncium.destroy
    respond_to do |format|
      format.html { redirect_to denuncia_url, notice: 'Denuncia se ha eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  def getKey
    $keymaps
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_denuncium
      $keymaps = ""
      #$keymaps = "AIzaSyD4dj_2wQLx3iZ5oMOERIGKaRBqn4bwDj0"
      @denuncium = Denuncium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def denuncium_params
      params.require(:denuncium).permit(:fecha, :descripcion, :longitud, :latitud, :estado, :catalogo_id)
    end

    def combos
      #@valores = Catalogo.joins(:institucioncatalogo).where(institucioncatalogo: {institucion: })
      @valores  = Catalogo.all
    end
end
