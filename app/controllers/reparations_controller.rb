class ReparationsController < ApplicationController
  before_action :set_client, only: [:edit, :update]
  before_action :set_reparation, only: [:edit, :update]

  def new
     @reparation = Reparation.new
     @clients = Client.all
  end
  
  def filter
    redirect_to clients_path(statut: params[:statut])
  end

  def create
    @reparation = Reparation.new(new_reparation_params)
    if @reparation.save
      redirect_to root_path, notice: 'Réparation créée avec succès.'
    else
      @clients = Client.all
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @reparation.update(reparation_params)
      redirect_to root_path, notice: 'Réparation mise à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
     @statuts = ["A faire", "En cours", "Terminé", "Repris par le client"]
  end

  private

  def set_client
    @client = Client.find_by(id: params[:client_id])
    unless @client
       redirect_to root_path, alert: "Client not found"
    end
  end

  def set_reparation
    @reparation = @client.reparations.find_by(id: params[:id])
    unless @reparation
       redirect_to root_path, alert: "Reparation not found"
    end
  end


  def reparation_params
    params.require(:reparation).permit(:appareil, :description, :statut)
  end

  def new_reparation_params
    params.require(:reparation).permit(:appareil, :description, :client_id)
  end
end
