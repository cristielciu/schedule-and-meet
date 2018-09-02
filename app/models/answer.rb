class Answer < ApplicationRecord
  belongs_to :appointment

  validates :appointment, uniqueness: { scope: :user_ip }

  scope :for_user, -> (user_ip) { where(user_ip: user_ip) }
end