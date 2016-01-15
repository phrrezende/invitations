class ConvitesController < ApplicationController
  before_action :set_convite, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:busca]

  # GET /convites
  def index
    @convites = Convite.all
  end

  # GET /convites/1
  def show
  end

  def busca 
    nome_da_busca= params[:nome_da_busca]
    #@convites=Convite.where('nome like ?', 'paulo').where_values_hash
    @convites=Convite.joins(:convidado).where("convidados.nome like '%#{nome_da_busca}%'")
    #@convites=Convite.where(convidado_id: "1")
    
  end
  # GET /convites/new
  def new
    @convite = Convite.new
    @convidados= Convidado.order(:nome)
  end

  # GET /convites/1/edit
  def edit
  end

  # POST /convites
  def create
    
    
    @convite = Convite.new(convite_params)
   
    if @convite.save
      redirect_to @convite, notice: 'Convite was successfully created.'
    else
      render :new
    end

    #render "teste"
  end

  # PATCH/PUT /convites/1
  def update
    if @convite.update(convite_params)
      redirect_to @convite, notice: 'Convite was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /convites/1
  def destroy
    @convite.destroy
    redirect_to convites_url, notice: 'Convite was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convite
      @convite = Convite.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def convite_params
      params.require(:convite).permit(:data_entrega, :convidado_id, :usuario_id)
    end

    protect_from_forgery with: :null_session
end
