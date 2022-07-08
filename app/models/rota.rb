class Rota < ApplicationRecord
  has_many :members

  def lowest_priority
    members.maximum(:priority) || 0
  end
end
