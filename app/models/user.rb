class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_many :appointments, foreign_key: :creator_id

  def future_appointments
    appointments.in_the_future.order(:starts_at, :name)
  end
end
