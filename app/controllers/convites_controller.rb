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
    @total_convites=@convites.count()
    render :busca

  end
  # GET /convites/new
  def new
    @convite = Convite.new
    @convidados= Convidado.sem_convite

    if @convidados.count() <= 0
      redirect_to convites_path, notice: "Todos convidados cadastrados receberam convite."
    end
  end

  # GET /convites/1/edit
  def edit
  end

  # POST /convites
  def create
    data= Time.new
    convite= {:data_entrega => data, 
    :convidado_id => params["convidado_id"], 
    :usuario_id => current_user.id}

   @convite = Convite.new(convite)

      respond_to do |format|
         if @convite.save
            #format.html {redirect_to @convite, notice: 'Convite criado com sucesso.'}
            format.json {render json: '[{"notice": "Convite Criado com Sucesso"}]'}
        else
            format.html {render :teste}
            format.js {}
        end

    end
   
  end

  # PATCH/PUT /convites/1
  def update
    if @convite.update(convite_params)
      redirect_to @convite, notice: 'Convite atualizado com sucesso'
    else
      render :edit
    end
  end

  # DELETE /convites/1
  def destroy
    @convite.destroy
    redirect_to convites_url, notice: 'Convite removido com sucesso.'
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
