class User < ActiveRecord::Base
  has_many :karma_points

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :username,
            presence: true,
            length: { minimum: 2, maximum: 32 },
            format: { with: /\A\w+\z/ },
            uniqueness: { case_sensitive: false }

  validates :email,
            presence: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }

  def self.by_karma
    joins(:karma_points).group('users.id').order('SUM(karma_points.value) DESC')
  end

  def total_karma
    self.karma_points.sum(:value)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
