class Reparation < ApplicationRecord
  belongs_to :client

  before_create :set_date_depot, :set_statut
  
  validates :appareil, presence: true
  validates :description, presence: true

  private

  def set_date_depot
    self.date_depot = Time.current
  end

  def set_statut
    self.statut = "A faire"
  end
end
