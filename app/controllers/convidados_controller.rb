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

  def todos_convidados
    @convidados= Convidado.all.order(:nome)
    @total_convidados=Convidado.all.count()
  end

  # GET /convidados/1
  def show
  end

  def busca
    nome_a_buscar = "%#{params[:nome]}%"
    @convidados= Convidado.where("nome like ? or conjuge like ?", nome_a_buscar, nome_a_buscar)
    respond_to do |format|
      #format.html {render :busca}
      format.json {render json: @convidados}
    end
    
  end

  def busca_com_filtro
    filtro= params[:filtro_selecionado]
    valor="%#{params[:valor_filtro]}%"
    @convidados=Convidado.busca_com_filtro(filtro, valor)
    @total_convidados=@convidados.count()
    render :index
  end


  def filtrar
    @opcao= params[:opcao_filtro]

    case @opcao
    when "descricao"
      @dados=Convidado.descricao()
    when "bairro"
      @dados=Convidado.bairro()
    when "cidade"
      @dados=Convidado.cidade()
    end

    respond_to do |format|
      #format.html {render :busca}
      format.json {render json: @dados}
    end
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
      redirect_to new_convidado_path, notice: 'Convidado criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /convidados/1
  def update
    if @convidado.update(convidado_params)
      redirect_to convidados_path, notice: 'Convidado atualizado.'
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
