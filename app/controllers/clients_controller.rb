class ClientsController < ApplicationController
  def index
    @clients = Client.all
    @statut = params[:statut]

    if @statut.present?
      @reparations = Reparation.where(statut: @statut)
    else
      @reparations = Reparation.all
    end
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def client_params
    params.require(:client).permit(:nom, :email)
  end
end
