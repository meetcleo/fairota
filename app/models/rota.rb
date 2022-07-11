class Rota < ApplicationRecord
  has_many :members

  def prioritised_members
    members.order(priority: :asc)
  end

  def lowest_priority
    members.maximum(:priority) || 0
  end

  def highest_priority
    members.minimum(:priority) || 1
  end
end
