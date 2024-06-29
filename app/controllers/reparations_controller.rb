class ReparationsController < ApplicationController
  before_action :set_client
  before_action :set_reparation, only: [:edit, :update]

  def create
    @reparation = @client.reparations.build(reparation_params)
    if @reparation.save
      redirect_to root_path, notice: 'Réparation créée avec succès.'
    else
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
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_reparation
    @reparation = @client.reparations.find(params[:id])
  end

  def reparation_params
    params.require(:reparation).permit(:appareil, :description, :statut)
  end
end
