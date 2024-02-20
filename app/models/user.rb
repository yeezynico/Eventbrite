class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Please enter a valid email adress" }

  has_many :administrated_events, foreign_key: 'admin_id', class_name: "Event", dependent: :destroy #méthodes .admin et .administrated_events
  has_many :attendances, foreign_key: 'attendee_id', class_name: "Attendance", dependent: :destroy #méthodes .customer et .attendances
  has_many :events, through: :attendances, dependent: :destroy
end
