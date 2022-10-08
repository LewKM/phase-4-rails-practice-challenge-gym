class Client < ApplicationRecord

    has_many :memberships
    has_many :gyms, through: :memberships

    def membership_summary
        costs = self.memberships.sum[:charge]
    end
end
