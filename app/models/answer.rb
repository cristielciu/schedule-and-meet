class Answer < ApplicationRecord
  belongs_to :appointment

  validates :appointment, uniqueness: { scope: :user_ip }
  validates_presence_of :user_name
  scope :for_user, -> (user_ip) { where(user_ip: user_ip) }
  scope :attempting, -> { where(attempting: true) }
end