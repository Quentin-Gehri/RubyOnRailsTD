class Client < ApplicationRecord
   has_many :reparations

   validates :nom, presence: true
   validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
end
