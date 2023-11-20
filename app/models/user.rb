class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :goals

  validates :first_name,
            length: { maximum: 127, too_long: "%{count} characters is the maximum allowed" },
            presence: true
  validates :last_name,
            length: { maximum: 127, too_long: "%{count} characters is the maximum allowed" },
            presence: true
  validates :email,
            length: { maximum: 255, too_long: "%{count} characters is the maximum allowed" },
            presence: true
  validates :encrypted_password,
            length: { maximum: 72, too_long: "%{count} characters is the maximum allowed",
                      minimum: 6, too_short: "%{count} characters is the minimum allowed" },
            presence: true

  def goal_empty?
    goals.empty?
  end
end
