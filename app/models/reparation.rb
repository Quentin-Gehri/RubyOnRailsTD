class Reparation < ApplicationRecord
  belongs_to :client

  before_create :set_date_depot

  private

  def set_date_depot
    self.date_depot = Time.current
  end
end
