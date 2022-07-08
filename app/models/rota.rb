class Rota < ApplicationRecord
  has_many :members

  def prioritised_members
    members.order(priority: :asc)
  end

  def lowest_priority
    members.maximum(:priority) || 0
  end
end
