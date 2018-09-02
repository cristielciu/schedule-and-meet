class Appointment < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :answers, foreign_key: 'appointment_id'

  validates :name, presence: true
  validates :starts_at, presence: true

  has_secure_token :url_token

  scope :in_the_future, -> { where('starts_at > ?', DateTime.now) }

  def external_url
    ENV["url"] + "appointment?key=#{url_token}"
  end

  def user_answered(user)
    answer_for_user(user).present?
  end

  def answer_for_user(user)
    answers.for_user(user).first
  end
end