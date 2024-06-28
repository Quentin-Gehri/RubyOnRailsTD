class Client < ApplicationRecord
   has_many :reparations

   validates :nom, presence: true
end
