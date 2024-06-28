class ReparationsController < ApplicationController

def create
    @client = Client.find(params[:client_id])
    @reparation = @client.reparations.create(reparation_params)
    redirect_to client_path(@client)
  end

  private
    def reparation_params
      params.require(:reparation).permit(:appareil, :description, :statut)
    end
end
