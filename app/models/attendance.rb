class Attendance < ApplicationRecord
  after_create :new_attendee_send

  def new_attendee_send
    UserMailer.new_attendee_email(self).deliver_now
  end

  belongs_to :attendee, class_name: "User", optional: true
  belongs_to :event, optional: true
end
