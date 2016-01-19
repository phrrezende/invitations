class ConvitesController < ApplicationController
  before_action :set_convite, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /convites
  def index
    @convites = Convite.all
    @total_convites=Convite.busca_total
  end

  # GET /convites/1
  def show
  end

  def busca 
    nome_da_busca= params[:nome]
    @convites=Convite.busca(nome_da_busca)
    render :busca
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
      params.require(:convite).permit(:data_entrega, :convidado_id, :user_id)
    end

    protect_from_forgery with: :null_session
end
