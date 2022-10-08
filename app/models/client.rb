class Client < ApplicationRecord

    has_many :memberships
    has_many :gyms, through: :memberships

    def membership_summary
        costs = self.memberships.map{|membership| membership.charge}
        costs.reduce(:+)
    end
end
