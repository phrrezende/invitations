class ConvidadosController < ApplicationController
  before_action :set_convidado, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /convidados
  def index
    @convidados = Convidado.sem_convite.order(:nome)
    @convidados_bairro=Convidado.sem_convite.select(:bairro).distinct.order(:bairro)
    @total_convidados=Convidado.busca_total
    @total_convites=Convite.busca_total
  end

  # GET /convidados/1
  def show
  end

  def busca
    nome_a_buscar = "%#{params[:nome]}%"
    @convidados= Convidado.where "nome like ?", nome_a_buscar
    respond_to do |format|
      #format.html {render :busca}
      format.json {render json: @convidados}
    end
    
  end

  def busca_bairro
    nome_bairro= "%#{params[:nome_bairro]}%"
    @convidados=Convidado.busca_bairro(nome_bairro)
    @convidados_bairro=Convidado.sem_convite.select(:bairro).distinct.order(:bairro)
    render :index
  end

  # GET /convidados/new
  def new
    @convidado = Convidado.new
  end

  # GET /convidados/1/edit
  def edit
  end

  # POST /convidados
  def create
    @convidado = Convidado.new(convidado_params)

    if @convidado.save
      redirect_to @convidado, notice: 'Convidado was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /convidados/1
  def update
    if @convidado.update(convidado_params)
      redirect_to @convidado, notice: 'Convidado was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /convidados/1
  def destroy
    @convidado.destroy
    redirect_to convidados_url, notice: 'Convidado was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convidado
      @convidado = Convidado.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def convidado_params
      params.require(:convidado).permit(:nome, :conjuge, :endereco, :bairro, :cidade, :descricao)
    end
end
