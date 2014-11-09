class KarmaPoint < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :label, presence: true
end
