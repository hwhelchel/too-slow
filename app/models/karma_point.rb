class KarmaPoint < ActiveRecord::Base
  belongs_to :user
  after_save :update_total_karma

  validates :user, presence: true
  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :label, presence: true

  def update_total_karma
    user.sum_karma_points
  end
end
