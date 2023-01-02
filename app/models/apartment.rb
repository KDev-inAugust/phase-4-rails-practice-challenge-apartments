class Apartment < ApplicationRecord
    has_many :tenants
    has_many :leases

    validates :number, presence: true
    validates :number, numericality: { greater_than: 0 }

  
end
