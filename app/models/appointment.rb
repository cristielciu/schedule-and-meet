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

  def post_on_facebook(token, group_id)
    graph = Koala::Facebook::API.new(token)
    graph.put_connections(group_id, 'feed', message: "New appointment: #{name} check it out. \n #{description} \n #{starts_at.strftime('%m/%d/%Y, %H:%M')}", link: external_url, caption: name)
  end

  def user_answered(user)
    answer_for_user(user).present?
  end

  def answer_for_user(user)
    answers.for_user(user).first
  end

  def attempting
    answers.attempting.count + answers.attempting.sum(&:guests)
  end
end