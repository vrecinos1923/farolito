class InstitucioncatalogosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_institucioncatalogo, only: [:show, :edit, :update, :destroy]

  # GET /institucioncatalogos
  # GET /institucioncatalogos.json
  def index
    @institucion = Institucion.where(:id => params[:institucion_id]).first
    @institucioncatalogos = Institucioncatalogo.where(:institucion_id => params[:institucion_id])
  end

  # GET /institucioncatalogos/1
  # GET /institucioncatalogos/1.json
  def show
  end

  # GET /institucioncatalogos/new
  def new
    #raise params[:institucion_id].to_json
    @institucion = Institucion.where(:id => params[:institucion_id]).first
    #raise @institucion.to_json
    @valores = Catalogo.all
    @institucioncatalogo = Institucioncatalogo.new
    @institucioncatalogo.institucion_id = params[:institucion_id]
  end

  # GET /institucioncatalogos/1/edit
  def edit
    @valores = Catalogo.all
    @institucion = Institucion.where(:id => params[:institucion_id]).first
  end

  # POST /institucioncatalogos
  # POST /institucioncatalogos.json
  def create
    @valores = Catalogo.all
    @institucion = Institucion.where(:id => institucioncatalogo_params['institucion_id']).first
    @institucioncatalogo = Institucioncatalogo.new(institucioncatalogo_params)

    respond_to do |format|
      if @institucioncatalogo.save
        format.html { redirect_to institucion_institucioncatalogos_url(@institucion), notice: 'El registro se ha creado exitosamente.' }
        format.json { render :show, status: :created, location: @institucioncatalogo }
      else
        format.html { render :new }
        format.json { render json: @institucioncatalogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /institucioncatalogos/1
  # PATCH/PUT /institucioncatalogos/1.json
  def update
    @valores = Catalogo.all
    @institucion = Institucion.where(:id => institucioncatalogo_params['institucion_id']).first
    respond_to do |format|
      if @institucioncatalogo.update(institucioncatalogo_params)
        format.html { redirect_to institucion_institucioncatalogos_url(@institucion), notice: 'El registro se ha actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @institucioncatalogo }
      else
        format.html { render :edit }
        format.json { render json: @institucioncatalogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institucioncatalogos/1
  # DELETE /institucioncatalogos/1.json
  def destroy
    @institucion = Institucion.find(params[:institucion_id])
    @institucioncatalogo.destroy
    respond_to do |format|
      format.html { redirect_to institucion_institucioncatalogos_url(@institucion), notice: 'El registro se ha eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institucioncatalogo
      @institucioncatalogo = Institucioncatalogo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def institucioncatalogo_params
      params.require(:institucioncatalogo).permit(:catalogo_id, :institucion_id)
    end
end
