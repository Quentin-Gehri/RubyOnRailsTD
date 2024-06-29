class Reparation < ApplicationRecord
  belongs_to :client

  before_create :set_date_depot
  
  validates :appareil, presence: true
  validates :description, presence: true
  validates :date_depot, presence: true
  validates :statut, presence: true

  private

  def set_date_depot
    self.date_depot = Time.current
  end

  def set_status
    self.status = "A faire"
  end
end
